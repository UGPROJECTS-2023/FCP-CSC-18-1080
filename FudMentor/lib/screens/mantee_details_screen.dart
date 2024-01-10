import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class MenteeDetailsScreen extends StatelessWidget {
  final String menteeName;
  final String menteeImage;
  final Random random = Random();

  MenteeDetailsScreen({
    required this.menteeName,
    required this.menteeImage,
  });

  @override
  Widget build(BuildContext context) {
    // List of mentee details
    List<Map<String, dynamic>> menteeDetailsList = [
      {
        'Name': ' AL-AMIN HANGA',
        'phone': '08160186137',
        'email': 'ALAMINHANGA96@gmail.com ',
        'level': '400',
        'gender': 'Male',
        'age': '25', // Placeholder for age
      },
      {
        'Name': 'Josephine Langford',
        'phone': '09072652827',
        'email': 'Josephinelangford@gmail.com',
        'level': '100',
        'gender': 'Female',
        'age': '22', // Placeholder for age
      },
      {
        'Name': 'MusaShehu@gmail.com',
        'phone': '08034867548',
        'email': 'Musab@yahoo.com',
        'level': '300',
        'gender': 'Male',
        'age': '24', // Placeholder for age
      },
      {
        'Name': 'Kabir Kabir Dalha',
        'phone': '08066599577',
        'email': 'KabirKabir@gmail.com',
        'level': '100',
        'gender': 'Male',
        'age': '23', // Placeholder for age
      },
      {
        'Name': 'Zainab Isa Abba',
        'phone': '090654578176',
        'email': 'Zainabisah@gmail.com',
        'level': '400',
        'gender': 'Female',
        'age': '21', // Placeholder for age
      },
      {
        'Name': 'Mustapha Shehu',
        'phone': '07080282745',
        'email': 'kabeemkb@gmail.com',
        'level': '400',
        'gender': 'Male',
        'age': '26', // Placeholder for age
      },
      {
        'Name': 'Fahad Salisu',
        'phone': '08160186137',
        'email': 'WaleelWaleel@yahoo.com',
        'level': '100',
        'gender': 'Male',
        'age': '28', // Placeholder for age
      },
      {
        'Name': 'Mummy Zee',
        'phone': '07062836837',
        'email': 'Mumeezee@gmail.com',
        'level': '100',
        'gender': 'Female',
        'age': '20', // Placeholder for age
      },
      {
        'Name': 'Wand Musa',
        'phone': '08034479855',
        'email': 'musawanda@gmail.com',
        'level': '400',
        'gender': 'Male',
        'age': '27', // Placeholder for age
      },
    ];

    // Randomly choose one mentee detail
    Map<String, dynamic> menteeDetails =
        menteeDetailsList[random.nextInt(menteeDetailsList.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mentee Details'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'mentee_avatar_',
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/download.png'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            menteeName,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Mentee Details:'),
          ListTile(
            title: Text('Name: ${menteeDetails['Name']}'),
            subtitle: Text('Email: ${menteeDetails['email']}'),
          ),
          ListTile(
            title: Text('Phone: ${menteeDetails['phone']}'),
            subtitle: Text('Level: ${menteeDetails['level']}'),
          ),
          ListTile(
            title: Text('Gender: ${menteeDetails['gender']}'),
            subtitle: Text('Age: ${menteeDetails['age']}'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle phone call
                  window.open('tel:${menteeDetails['phone']}', '_self');
                },
                child: Text('Contact Mentee'),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle email
                  window.open('mailto:${menteeDetails['email']}', '_self');
                },
                child: Text('Send Email'),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
