import 'dart:async';
import 'package:dine/utils/Auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

final Auth _auth = Auth();

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SlashState();
}

class _SlashState extends State<WelcomeScreen> {
  @override
  initState() {
    super.initState();
    if (_auth.currentUser != null) {
      Navigator.of(context).popAndPushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcomebg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'DINE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Bring your food fantasies home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/register');
                },
                child: const Text('Get started'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 240,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/login');
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
