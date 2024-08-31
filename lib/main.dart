import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/view/Home_screen/screen/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsScreenWrpper(),
    );
  }
}
