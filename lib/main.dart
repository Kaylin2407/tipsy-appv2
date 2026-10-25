import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'home_screen.dart';

import 'games_screen.dart';

import 'profile_screen.dart';

import 'login_screen.dart';

const Color primaryColor = Color(0xFF1A1A2E);

const Color accentColor = Color(0xFFE94560);

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(const TipsyApp());

}

class TipsyApp extends StatelessWidget {

  const TipsyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'TIPSY',

      theme: ThemeData(

        brightness: Brightness.dark,

        scaffoldBackgroundColor: primaryColor,

        primaryColor: primaryColor,

        colorScheme: const ColorScheme.dark().copyWith(

          primary: accentColor,

          secondary: accentColor,

        ),

        fontFamily: 'Poppins',

      ),

      debugShowCheckedModeBanner: false,

      home: const LoginScreen(),

    );

  }

}

// ... (The AppShell class remains the same and is needed)
class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  _AppShellState createState() => _AppShellState();
}
class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const GamesScreen(),
    const ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: primaryColor.withBlue(60),
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),
      ),
    );
  }
}