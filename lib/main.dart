import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/models/bottom.dart';
import 'package:stich/models/shoes.dart';
import 'package:stich/models/top.dart';
import 'package:stich/providers/closet_provider.dart';
import 'package:stich/providers/suggestions_provider.dart';
import 'package:stich/views/closet_view.dart';
import 'package:stich/views/suggestions_view.dart';
import 'package:stich/widgets/add_photo.dart';
import 'package:stich/widgets/tab_selector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
  [TopSchema, BottomSchema, ShoesSchema],
  directory: dir.path,
);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp(isar: isar));
}

class MainApp extends StatefulWidget {
  final Isar isar;
  const MainApp({super.key, required this.isar});

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
            tops: widget.isar.tops.where().findAllSync(),
            bottoms: widget.isar.bottoms.where().findAllSync(),
            shoes: widget.isar.shoes.where().findAllSync(),
            isar: widget.isar
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
              isar: widget.isar,
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
  final Isar isar;
  const MainScreen({
    super.key,
    required this.selectedTab,
    required this.onTabChange,
    required this.isar
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 20,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            if (selectedTab == TabState.suggestions)
                              SizedBox(
                                width: constraints.maxWidth,
                                child: SuggestionsView(isar: isar),
                              ),
                            if (selectedTab == TabState.closet)
                              SizedBox(
                                width: constraints.maxWidth,
                                child: const ClosetView(),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _bottomBar(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
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
