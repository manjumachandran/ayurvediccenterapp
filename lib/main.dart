import 'package:flutter/material.dart';
import 'package:machne_test/screens/bookingList_Screen.dart';
import 'package:machne_test/screens/login_screen.dart';
import 'package:machne_test/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayurvedics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
