import 'package:flutter/material.dart';
import 'package:navigasi_go_route/Config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Go Router 5.0.1',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const CategoryScreen(),
      routerConfig: router,
    );
  }
}
