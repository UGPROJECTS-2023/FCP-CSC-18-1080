// lib/screens/mentor_details_screen.dart
import 'package:flutter/material.dart';
import 'package:fudmentor/models/mentor.dart';

class MentorDetailsScreen extends StatelessWidget {
  final Mentor mentor;

  MentorDetailsScreen({required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Details'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${mentor.name}'),
            Text('Email: ${mentor.email}'),
            Text('Phone: ${mentor.phone}'),
            // Add other details as needed
          ],
        ),
      ),
    );
  }
}
