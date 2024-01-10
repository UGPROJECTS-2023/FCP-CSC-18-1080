import 'package:flutter/material.dart';
import 'package:fudmentor/models/mentor.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorListScreen extends StatelessWidget {
  final List<Mentor> mentors;

  MentorListScreen({required this.mentors});

  @override
  Widget build(BuildContext context) {
    // Assuming you have at least one mentor in the list
    Mentor mentor = Mentor(
      name: 'Mal Abdulaziz',
      email: 'abdulaziz21@gmail.com',
      phone: '08077561461',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor List'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('Name: ${mentor.name}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: ${mentor.email}'),
                Text('Phone: ${mentor.phone}'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchPhoneCall(mentor.phone);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  primary: Colors.black,
                ),
                child: Text('Contact Mentor'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchEmail(mentor.email);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  primary: Colors.black,
                ),
                child: Text('Send Email'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
