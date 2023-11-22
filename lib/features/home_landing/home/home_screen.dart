import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: const CoptixContainer(
        child: Text('This is the Home Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
