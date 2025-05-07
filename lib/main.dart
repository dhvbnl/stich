import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stich/env/env.dart';
import 'package:stich/helpers/constants.dart';
import 'package:stich/helpers/mock_data.dart';
import 'package:stich/helpers/tab_state.dart';
import 'package:stich/providers/closet_provider.dart';
import 'package:stich/providers/suggestions_provider.dart';
import 'package:stich/views/article_view.dart';
import 'package:stich/views/suggestions_view.dart';
import 'package:stich/widgets/tab_selector.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:image_picker/image_picker.dart';

Future<void> main() async {
  OpenAI.apiKey = Env.apiKey;
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
            tops: getMockTops(),
            bottoms: getMockBottoms(),
            shoes: getMockShoes(),
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
              const Expanded(child: Placeholder()),
            _bottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            child: IconButton.filled(
              style: IconButton.styleFrom(
                minimumSize: const Size(55, 55),
                iconSize: 35,
                backgroundColor: kSecondaryColor,
                shape: const CircleBorder(),
              ),
              onPressed: () async {
                await cameraTest(context);
              },
              icon: const Icon(Icons.add, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> cameraTest(BuildContext context) async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.camera);

  if (context.mounted && image != null) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ArticleView(image: image),
      ),
    );
  }
}
