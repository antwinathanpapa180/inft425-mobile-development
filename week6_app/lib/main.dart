import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Week6App());
}

class Week6App extends StatelessWidget {
  const Week6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INFT 425 Week 6 App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
