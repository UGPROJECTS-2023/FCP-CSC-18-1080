import 'package:flutter/material.dart';
import 'package:fudmentor/screens/mentor_mentee_list_screen.dart';
import 'package:fudmentor/screens/mentor_list_screen.dart';
import 'package:fudmentor/models/mentor.dart';
import 'dart:async';

class MenteeRegistrationScreen extends StatefulWidget {
  @override
  _MenteeRegistrationScreenState createState() =>
      _MenteeRegistrationScreenState();
}

class _MenteeRegistrationScreenState extends State<MenteeRegistrationScreen> {
  final TextEditingController _registrationNumberController =
      TextEditingController();

  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FUD MENTOR'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _registrationNumberController,
              decoration: InputDecoration(labelText: 'Registration Number'),
            ),
            SizedBox(height: 10),
            Visibility(
              visible: _errorText.isNotEmpty,
              child: Text(
                _errorText,
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement mentee registration logic here
                String registrationNumber =
                    _registrationNumberController.text.trim();
                if (_isValidRegistrationNumber(registrationNumber)) {
                  // Extract the last 4 digits from the registration number
                  int lastDigits = int.parse(registrationNumber.substring(14));

                  // Choose the mentor based on the range
                  String mentorName = 'Unknown Mentor';
                  if (lastDigits >= 1 && lastDigits <= 10) {
                    mentorName = 'Mal Abdulaziz';
                  } else if (lastDigits >= 11 && lastDigits <= 20) {
                    mentorName = 'Mal Shehu';
                  }

                  // Navigate to MentorListScreen with the chosen mentor
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MentorListScreen(
                        mentors: [
                          Mentor(
                            name: mentorName,
                            email:
                                'mentor@example.com', // Add appropriate email
                            phone: '1234567890', // Add appropriate phone number
                          ),
                        ],
                      ),
                    ),
                  );

                  // Registration number is valid, perform actions
                  // e.g., save it to the database
                } else {
                  setState(() {
                    _errorText = 'Invalid Registration Number';
                  });

                  // Set a timer to reset the error message after 3 seconds
                  Timer(Duration(seconds: 3), () {
                    setState(() {
                      _errorText = '';
                    });
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                primary: Colors.black,
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Developed by Khaleel',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidRegistrationNumber(String registrationNumber) {
    // Check if the registration number is within the specified range
    for (int i = 1; i <= 100; i++) {
      String validNumber = 'FCP/CSC/18/${i.toString().padLeft(4, '0')}';
      if (registrationNumber == validNumber) {
        return true;
      }
    }
    return false;
  }
}
