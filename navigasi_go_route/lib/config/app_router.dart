import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../Screens/category_screen.dart';
import '../Screens/productlist_screen.dart';
import '../cubits/cubit/login_cubit.dart';
import '../screens/login_screen.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
          path: "/login",
          name: 'login',
          // ignore: non_constant_identifier_names
          builder: (BuildContext context, GoRouterState State) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: "/",
          name: 'home',
          // ignore: non_constant_identifier_names
          builder: (BuildContext context, GoRouterState State) {
            return const CategoryScreen();
          },
          routes: [
            GoRoute(
              path: 'product_list/:category',
              name: 'product_list',
              builder: (BuildContext context, GoRouterState state) {
                return ProductListScreen(
                  category: state.params['category']!,
                  asc: state.queryParams['sort'] == 'asc',
                  quantity: int.parse(state.queryParams['filter'] ?? '0'),
                );
              },
            ),
          ],
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        // Chek if the user is logged in,
        final bool loggedIn =
            loginCubit.state.status == AuthStatus.authenticated;
        //final bool loggedIn = //cubit
        // chek if the user is logging in
        final bool loggingIn = state.subloc == 'login';

        if (!loggedIn) {
          return loggingIn ? null : '/login';
        }
        if (loggingIn) {
          return '/';
        }
        return null;
      },
      refreshListenable: GoRouterStream(loginCubit.stream));
}

class GoRouterStream extends ChangeNotifier {
  GoRouterStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription =
        stream.asBroadcastStream().listen((dynamic _) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
