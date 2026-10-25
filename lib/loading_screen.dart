import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';
import 'main.dart';
import 'loading_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedGradient(
            colors: [primaryColor.withBlue(50), primaryColor],
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(Icons.flash_on, color: accentColor, size: 80),
                  const SizedBox(height: 20),
                  const Text('TIPSY', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 52, fontWeight: FontWeight.bold, letterSpacing: 4)),
                  const SizedBox(height: 60),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: _buildInputDecoration('Email'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: _buildInputDecoration('Password'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoadingScreen()),
                      );
                    },
                    child: const Text('SIGN IN', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  _buildSocialLoginButton(),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                       Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoadingScreen()),
                      );
                    },
                    child: Text('No account? Sign up now', style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: accentColor.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(12)),
    );
  }
  Widget _buildSocialLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: const Text('Continue with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}