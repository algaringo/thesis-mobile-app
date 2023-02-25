import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/features/authentication/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Mobile App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: null,
        body: LoginScreen(title: 'Login'),
      ),
    );
  }
}
