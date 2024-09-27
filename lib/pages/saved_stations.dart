import 'package:flutter/material.dart';

class SavedStationsPage extends StatefulWidget {
  const SavedStationsPage({super.key});

  @override
  State<SavedStationsPage> createState() => _SavedStationsPageState();
}

class _SavedStationsPageState extends State<SavedStationsPage> {
  Widget build(BuildContext context) {
    return Center(
      child: Text('Saved Stations Page', style: TextStyle(fontSize: 24)),
    );
  }
}
