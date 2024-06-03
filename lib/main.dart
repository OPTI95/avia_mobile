import 'package:effective_mobile/services/app_theme.dart';
import 'package:flutter/material.dart';
import 'services/app_router.dart';
import 'injection_container.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ru', ''),
        ],
        locale: const Locale('ru'),
        routerConfig: _appRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme);
  }
}
