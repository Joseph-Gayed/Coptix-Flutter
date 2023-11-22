import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Screen'),
      ),
      body: const CoptixContainer(
        child:
            Text('This is the Landing Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
