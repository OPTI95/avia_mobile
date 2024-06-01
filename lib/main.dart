import 'package:effective_mobile/services/app_theme.dart';
import 'package:flutter/material.dart';
import 'services/app_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme
    );
  }
}
