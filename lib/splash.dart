import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  String _displayText = "";
  String _fullText = "Shopping";
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();

    /// **🔹 Typing Animation Effect**
    Future.delayed(Duration(milliseconds: 500), () {
      _startTypingEffect();
    });

    /// **🔹 Navigate to Login Page After 3 Seconds**
    Future.delayed(Duration(seconds: 3), () {
      Get.to(Login());
    });
  }

  void _startTypingEffect() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_textIndex < _fullText.length) {
        setState(() {
          _displayText += _fullText[_textIndex];
          _textIndex++;
        });
        _startTypingEffect();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: _displayText.isEmpty ? 0.0 : 1.0,
          child: Text(
            _displayText,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              shadows: [
                Shadow(
                  blurRadius: 20,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
