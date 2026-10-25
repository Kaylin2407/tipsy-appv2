import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum LoginRole { limer, owner }

enum BillingPeriod { monthly, annual }

class _LoginTierInfo {
  final String id;
  final String name;
  final int monthlyUsd;
  final int annualUsd;
  final String badge;
  final List<String> perks;

  const _LoginTierInfo({
    required this.id,
    required this.name,
    required this.monthlyUsd,
    required this.annualUsd,
    required this.badge,
    required this.perks,
  });
}

const List<_LoginTierInfo> _kLoginTiers = [
  _LoginTierInfo(
    id: 'vibe',
    name: 'Vibe',
    monthlyUsd: 39,
    annualUsd: 390,
    badge: 'Game + Mapso',
    perks: [
      'Full Game access (All Fours, Dominoes & Spin Wheel)',
      'Mapso live Caribbean venue & lime access',
    ],
  ),
  _LoginTierInfo(
    id: 'limin',
    name: 'Limin',
    monthlyUsd: 79,
    annualUsd: 790,
    badge: 'Most Popular',
    perks: [
      'Everything in Vibe (\$39)',
      'Audio & DJ Booth live streams',
      'TopDrop discounts & venue fast passes',
    ],
  ),
  _LoginTierInfo(
    id: 'island',
    name: 'Island',
    monthlyUsd: 149,
    annualUsd: 1490,
    badge: 'IslandPayTT Wallet',
    perks: [
      'Everything in Limin (\$79)',
      'IslandPayTT digital wallet for bar tabs & split bills',
      '1.5x IslandLink Points multiplier',
    ],
  ),
  _LoginTierInfo(
    id: 'elite',
    name: 'Elite',
    monthlyUsd: 249,
    annualUsd: 2490,
    badge: 'VIP All-Access',
    perks: [
      'Everything in Island (\$149) + IslandPayTT wallet',
      '24/7 VIP support & exclusive island events',
      'Early access to new features & tournaments',
      'Direct networking with graphic designers',
    ],
  ),
];
97
final FirebaseAuth _auth = FirebaseAuth.instance;
98


99
Future<void> _handleUserRegistration() async {
100
  try {
101
    final credential = await _auth.createUserWithEmailAndPassword(
102
      email: _emailController.text.trim(),
103
      password: _passwordController.text.trim(),
104
    );
105
    // Success: navigate to home screen or update UI
106
  } on FirebaseAuthException catch (e) {
107
    setState(() {
108
      _statusMessage = e.message ?? 'Registration failed';
109
    });
110
  } catch (e) {
111
    setState(() {
112
      _statusMessage = 'An unexpected error occurred.';
113
    });
114
  }
115
}


    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _statusMessage = 'Please enter your email and password.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = '';
    });

    try {
      if (_isSignUpMode) {
        // Firebase Auth Sign Up
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Store user profile data in Firestore
        if (userCredential.user != null) {
          await _firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': email,
            'role': _selectedRole.name,
            'billingPeriod': _billingPeriod.name,
            'selectedTierId': _selectedTierId,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        setState(() {
          _statusMessage = 'Sign up successful!';
        });
      } else {
        // Firebase Auth Log In
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        setState(() {
          _statusMessage = 'Login successful!';
        });
      }

      if (widget.onLoginSuccess != null) {
        widget.onLoginSuccess!();
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _statusMessage = e.message ?? 'An authentication error occurred.';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'An unexpected error occurred: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070814),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0D16),
        elevation: 0,
        centerTitle: true,
        title: Text(
          _isSignUpMode ? 'SIGN UP & MEMBERSHIP TIERS' : 'TIPSY LOGIN',
          style: const TextStyle(
            color: Color(0xFFFF22D3EE),
            fontSize: 15,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0D1424),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF06B6D4).withValues(alpha: 0.45),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'TIPSY',
                    style: TextStyle(
                      color: Color(0xFFF22D3EE),
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'PLAY • LIME • CONNECT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'CARIBBEAN LIMIN APP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFBBF24),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form Inputs
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFF22D3EE)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFF22D3EE)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Role Selector (if Sign-Up)
            if (_isSignUpMode) ...[
              const Text(
                'Select Role',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<LoginRole>(
                      title: const Text('Limer', style: TextStyle(color: Colors.white)),
                      value: LoginRole.limer,
                      groupValue: _selectedRole,
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedRole = val);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<LoginRole>(
                      title: const Text('Owner', style: TextStyle(color: Colors.white)),
                      value: LoginRole.owner,
                      groupValue: _selectedRole,
                      onChanged: (val) {
                        if (val != null) setState(() => _selectedRole = val);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // Status / Error Message
            if (_statusMessage.isNotEmpty) ...[
              Text(
                _statusMessage,
                style: const TextStyle(color: Colors.amber, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],

            // Submit Button
            ElevatedButton(
              onPressed: _isLoading ? null : _handleuserregitration,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF22D3EE),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  : Text(
                      _isSignUpMode ? 'Sign Up' : 'Log In',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
            ),
            const SizedBox(height: 12),

            // Toggle Sign-Up / Login Mode
            TextButton(
              onPressed: () {
                setState(() {
                  _isSignUpMode = !_isSignUpMode;
                  _statusMessage = '';
                });
              },
              child: Text(
                _isSignUpMode
                    ? 'Already have an account? Log In'
                    : "Don't have an account? Sign Up",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}