import 'package:flutter/material.dart';

// Import our brand colors from the main file
import 'main.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIPSY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0, // No shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // This is the main Call to Action card
            _buildActionCard(
              context,
              icon: Icons.games,
              title: 'Start a Party Game',
              subtitle: 'Truth or Dare, Never Have I Ever, and more.',
              onTap: () {
                print('Navigate to Games screen');
              },
            ),
            const SizedBox(height: 20),
            
            // This is the secondary Call to Action card
            _buildActionCard(
              context,
              icon: Icons.map,
              title: 'Find a Lime',
              subtitle: 'Discover events and parties near you.',
              onTap: () {
                 print('Navigate to Map screen (Future Feature)');
              },
            ),
          ],
        ),
      ),
    );
  }

  // A reusable widget for our action cards to keep the code clean
  Widget _buildActionCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: primaryColor.withBlue(60), // Same color as our nav bar
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: accentColor, size: 48),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}