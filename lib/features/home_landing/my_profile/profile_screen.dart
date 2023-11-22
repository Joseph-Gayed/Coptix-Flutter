import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: const CoptixContainer(
        child:
            Text('This is the Profile Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
