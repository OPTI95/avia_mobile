import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widget/hostel_screen.dart';
import '../core/widget/main_screen.dart';
import '../core/widget/map_screen.dart';
import '../core/widget/profile_screen.dart';
import '../core/widget/subscription_screen.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/search/presentation/pages/search_page_widget.dart';
import '../features/ticket/presentation/pages/ticket_page.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/avia',
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainScreen(child: child);
          },
          routes: [
            GoRoute(
              path: '/avia',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: 'search',
                  name: 'search',
                  builder: (context, state) => const SearchPage(),
                  routes: [
                    GoRoute(
                      path: 'ticket',
                      name: 'ticket',
                      builder: (context, state) => const TicketPage(),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/hostel',
              builder: (context, state) => const HostelScreen(),
            ),
            GoRoute(
              path: '/map',
              builder: (context, state) => const MapScreen(),
            ),
            GoRoute(
              path: '/subscription',
              builder: (context, state) => const SubscriptionScreen(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
