// lib/screens/mentee_list_screen.dart
import 'package:flutter/material.dart';
import 'package:fudmentor/models/mentee.dart';

class MenteeListScreen extends StatelessWidget {
  final List<Mentee> mentees; // Assume you have a list of mentees

  MenteeListScreen({required this.mentees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentee List'),
      ),
      body: ListView.builder(
        itemCount: mentees.length,
        itemBuilder: (context, index) {
          Mentee mentee = mentees[index];
          return ListTile(
            title: Text(mentee.name),
            // Add additional mentee details or actions as needed
          );
        },
      ),
    );
  }
}
