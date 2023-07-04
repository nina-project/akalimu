import 'package:akalimu/data/local_preferences.dart';
import 'package:akalimu/data/providers/app_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'screens/main/home_page_route_screen.dart';
import 'screens/main/page_not_found.dart';
import 'widgets/center_mobile_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalPreferences().init();

  runApp(kIsWeb
      ? const CenterMobileViewWidget(
          child: MainApp(),
        )
      : const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePageRoute(),
      builder: (_, home) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppProvider(),
            lazy: false,
          ),
        ],
        child: home,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF163a96),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF163a96),
            ),
      ),
      routes: routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
      },
    );
  }
}
