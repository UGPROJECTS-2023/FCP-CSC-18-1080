import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fudmentor/screens/mentor_mentee_list_screen.dart';

class MentorRegistrationScreen extends StatefulWidget {
  @override
  _MentorRegistrationScreenState createState() =>
      _MentorRegistrationScreenState();
}

class _MentorRegistrationScreenState extends State<MentorRegistrationScreen> {
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
              decoration: InputDecoration(labelText: 'Staff ID'),
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
                // Implement mentor registration logic here
                String registrationNumber =
                    _registrationNumberController.text.trim();
                if (_isValidRegistrationNumber(registrationNumber)) {
                  // Registration number is valid, perform actions
                  // e.g., save it to the database

                  // Get a random list of 10 mentees (replace with your logic)
                  List<String> randomMentees = _getRandomMentees();

                  // Redirect to Mentor Mentee List Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MentorMenteeListScreen(mentees: randomMentees),
                    ),
                  );
                } else {
                  setState(() {
                    _errorText = 'Invalid Staff ID';
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
    // Check if the registration number is the specified FCP/STAFF/100
    return registrationNumber == 'FCP/STAFF/100';
  }

  List<String> _getRandomMentees() {
    // Implement your logic to select 10 random mentees from the list
    // For now, let's just create a dummy list
    return List.generate(10, (index) => 'Mentee ${index + 1}');
  }
}
