import 'package:flutter/material.dart';
import 'package:fudmentor/screens/mantee_details_screen.dart';
import 'dart:math';

class MentorMenteeListScreen extends StatelessWidget {
  final List<String> mentees;
  final Random random = Random();

  MentorMenteeListScreen({required this.mentees});

  String getAvatarImage() {
    final List<String> avatarImages = [
      'assets/6769264_60111.jpg',
      'assets/7309670.jpg',
      'assets/7309681.jpg',
      'assets/9334398.jpg',
      'assets/9723582.jpg',
      'assets/7309670.jpg',
      'assets/6769264_60111.jpg',
      'assets/7309681.jpg',
      'assets/9723582.jpg',
      'assets/9334398.jpg',
    ];

    return avatarImages[random.nextInt(avatarImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Mentee List'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: mentees.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle onTap action (e.g., navigate to mentee details screen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenteeDetailsScreen(
                      menteeName: mentees[index],
                      menteeImage: getAvatarImage(),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'mentee_avatar_$index',
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(getAvatarImage()),
                  ),
                  title: Text(mentees[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
