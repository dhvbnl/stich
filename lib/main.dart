import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stich/helpers/mock_data.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/providers/closet_provider.dart';
import 'package:stich/providers/suggestions_provider.dart';
import 'package:stich/views/closet_view.dart';
import 'package:stich/views/suggestions_view.dart';
import 'package:stich/widgets/add_photo.dart';
import 'package:stich/widgets/tab_selector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabState _selectedTab = TabState.suggestions;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SuggestionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClosetProvider(
            tops: [],
            bottoms: [],
            shoes:[],
          ),
        ),
      ],
      child: CupertinoApp(
        home: Navigator(
          onGenerateRoute: (_) => CupertinoPageRoute(
            builder: (context) => MainScreen(
              selectedTab: _selectedTab,
              onTabChange: (newTab) {
                setState(() {
                  _selectedTab = newTab;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final TabState selectedTab;
  final ValueChanged<TabState> onTabChange;

  const MainScreen({
    super.key,
    required this.selectedTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            if (selectedTab == TabState.suggestions)
              const Expanded(child: SuggestionsView()),
            if (selectedTab == TabState.closet)
              const Expanded(child: ClosetView()),
            _bottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 40,
        right: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 4,
            child: TabSelector(
              initialTab: selectedTab,
              onTabChange: onTabChange,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: AddPhoto(),
          ),
        ],
      ),
    );
  }
}
