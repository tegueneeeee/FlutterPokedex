import 'package:app/presentation/home/home_screen.dart';
import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterPokédex",
      theme: const CustomAppTheme().themeData,
      home: const HomeScreen(),
    );
  }
}
