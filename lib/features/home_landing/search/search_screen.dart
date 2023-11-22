import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: const CoptixContainer(
        child:
            Text('This is the Search Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
