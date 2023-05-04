import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SlashState();
}

class _SlashState extends State<SplashScreen> {
//Welcome notification
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const snackBar = SnackBar(content: Text(
        'Welcome to the kitchen of the best chief in town!!',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
        backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
  //splash screen duration
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        (() => Navigator.of(context).popAndPushNamed('/welcome')));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
