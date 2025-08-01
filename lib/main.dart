import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:machne_test/providers/login_provider.dart';
import 'package:machne_test/providers/patient_provider.dart';
import 'package:machne_test/providers/register_provider.dart';
import 'package:machne_test/services/register_services.dart';
import 'package:machne_test/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
        ChangeNotifierProvider(
          create: (_) => PatientRegistrationProvider(registerService: RegisterService(token: '')),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
