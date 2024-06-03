import 'package:effective_mobile/core/widget/hard_way_screen.dart';
import 'package:effective_mobile/core/widget/hot_tickets_screen.dart';
import 'package:effective_mobile/core/widget/weekday_screen.dart';
import 'package:effective_mobile/features/home/presentation/cubit/from_text_cubit.dart';
import 'package:effective_mobile/features/home/presentation/cubit/music_events_cubit.dart';
import 'package:effective_mobile/features/search/presentation/cubit/search_cubit.dart';
import 'package:effective_mobile/features/search/presentation/cubit/texts_cubit.dart';
import 'package:effective_mobile/features/ticket/presentation/cubit/ticket_cubit.dart';
import 'package:effective_mobile/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widget/hostel_screen.dart';
import '../core/widget/main_screen.dart';
import '../core/widget/map_screen.dart';
import '../core/widget/profile_screen.dart';
import '../core/widget/subscription_screen.dart';
import '../features/home/presentation/cubit/to_text_cubit.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/search/presentation/pages/search_page_widget.dart';
import '../features/ticket/presentation/pages/ticket_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => di.sl<MusicEventsCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<FromTextCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<ToTextCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<TextsCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<SearchCubit>(),
                ),
                BlocProvider(
                  create: (context) => di.sl<TicketCubit>(),
                ),
              ],
              child: MainScreen(child: child),
            );
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
                GoRoute(
                  path: 'hardway',
                  name: 'hardway',
                  builder: (context, state) => const HardWayScreen(),
                ),
                GoRoute(
                  path: 'weekday',
                  name: 'weekday',
                  builder: (context, state) => const WeekdayScreen(),
                ),
                GoRoute(
                  path: 'hottickets',
                  name: 'hottickets',
                  builder: (context, state) => const HotTicketsScreen(),
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
