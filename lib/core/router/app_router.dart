import 'package:go_router/go_router.dart';

import 'package:flemby/presentation/account_selection/pages/account_selection.dart';
import 'package:flemby/presentation/server_selection/pages/server_selection.dart';

class AppRouter {
  static const serverSelection = '/server-selection';
  static const accountSelection = '/account-selection';

  static final GoRouter router = GoRouter(
    initialLocation: serverSelection,
    routes: [
      GoRoute(
        path: serverSelection,
        builder: (context, state) => const ServerSelectionPage(),
      ),
      GoRoute(
        path: accountSelection,
        builder: (context, state) => const AccountSelectionPage(),
      ),
    ],
  );
}
