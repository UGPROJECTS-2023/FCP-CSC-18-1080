import 'package:flutter/material.dart';

class DeveloperDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Details'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Developer: Ibraheem Suleiman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: khaleelIbraheem341@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Phone: +234 8034479855',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'About This App:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This app is designed to facilitate mentorship programs at FUD. '
              'It connects mentors and mentees, providing a platform for '
              'meaningful interactions and guidance.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Special Thanks:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Special thanks to Mal Abdulaziz Yusuf for his valuable contributions, enforcement '
              'and support in the development of this app.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
