import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/homepage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.09),
        
                  // Login Image
                  Image.asset('assets/login.png'),
                  SizedBox(height: screenHeight * 0.05),
        
                  // Number Field
                  TextFormField(
                    controller: _numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your Number',
                      labelText: 'Your Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your number';
                      } else if (value.length != 10) {
                        return 'Please enter a valid 10-digit number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
        
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true, // Password hidden rahega
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      labelText: 'Your Password',
                      suffixIcon: Icon(Icons.remove_red_eye, color: Colors.deepOrangeAccent),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Please enter more than 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
        
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(HomePage());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 65),
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Register Button
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(HomePage());
                      }
                    },
                    child: Text(
                      "Don't have an account? Register",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
