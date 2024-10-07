import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Cubit Screen'),
              const SizedBox(height: 20),
              const Text(''),
              const SizedBox(height: 250),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text('Search')),
            ],
          ),
        ),
      ),
    );
  }
}
