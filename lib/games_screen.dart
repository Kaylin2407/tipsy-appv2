import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'main.dart'; 

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final List<String> _cards = [
    'What\'s the most embarrassing thing you\'ve ever done?',
    'Never have I ever lied to get out of trouble.',
    'If you could have any superpower, what would it be?',
    'What\'s your biggest secret?',
    'Truth: What\'s your guilty pleasure song?',
    'Dare: Do your best impression of a celebrity.',
    'Never have I ever stalked an ex on social media.',
    'What\'s the last lie you told?',
  ];

  String _currentCardText = 'Ready to play?';

  void _drawNextCard() {
    if (cardKey.currentState?.isFront ?? true) {
      setState(() {
        _currentCardText = (_cards..shuffle(Random())).first;
      });
      cardKey.currentState?.toggleCard();
    } else {
      cardKey.currentState?.toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PARTY GAMES', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 4)),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                front: _buildCardFace('Tap "Next Card" to begin!'),
                back: _buildCardFace(_currentCardText),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _drawNextCard,
                child: const Text('NEXT CARD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardFace(String text) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: primaryColor.withBlue(60),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor, width: 2),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              // THIS IS THE FIXED LINE. We use a more modern way to set opacity.
              color: Colors.white.withAlpha(230), // 230 is approx 90% opacity
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}