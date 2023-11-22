import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

class NewAdditionsScreen extends StatefulWidget {
  const NewAdditionsScreen({super.key});

  @override
  State<NewAdditionsScreen> createState() => _NewAdditionsScreenState();
}

class _NewAdditionsScreenState extends State<NewAdditionsScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: const CoptixContainer(
        child: Text('This is the New Additions Screen',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
