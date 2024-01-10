import 'package:flutter/material.dart';
import 'package:fudmentor/screens/mentee_registration_screen.dart';
import 'package:fudmentor/screens/mentor_registration_screen.dart';
import 'package:fudmentor/screens/developer_details_screen.dart'; // Import the new screen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('FUD MENTOR')),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: CustomPaint(
                painter: CustomPaintImage(),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add your logo here
                      Expanded(
                        child: Image.asset(
                          'assets/PngItem_2829738.png', // Change this to your logo asset path
                          width: 250, // Adjust the width as needed
                          height: 250, // Adjust the height as needed
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MentorRegistrationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          primary: Colors.black,
                        ),
                        child: Text(
                          'Login as Mentor',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenteeRegistrationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          primary: Colors.black,
                        ),
                        child: Text(
                          'Login as Mentee',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to the developer details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperDetailsScreen(),
                  ),
                );
              },
              child: Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPaintImage extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // Draw diagonal lines from top-left to bottom-right
    for (double i = -size.width; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.width, size.height), paint);
    }

    // Draw diagonal lines from top-right to bottom-left
    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i - size.width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
