import 'package:flutter/material.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("RandoMeme 🎲"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Placeholder(),
            const SizedBox(height: 20),
            Text("Author: Backfisch123xX"),
          ],
        ),
      ),
    );
  }
}
