import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../Screens/category_screen.dart';
import '../Screens/productlist_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
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
);
