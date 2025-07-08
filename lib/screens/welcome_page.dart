import 'package:flutter/material.dart';
import 'package:vet/main.dart';
import 'package:vet/screens/login.dart';
import 'package:vet/main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Image
              SizedBox(height: 10),
              Image.asset(
                'assets/images/welcome_page_pic.png', // Path to your logo image
                height: 283, // Adjust the size of the logo as needed
                width: 249,
              ),
              SizedBox(height: 10), // Space between the text and the button

              // Button
              ElevatedButton(
                  onPressed: () {
                    // Action when button is pressed
                    print('Button Pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Set background to transparent
                    elevation: 0, // Remove shadow
                    padding: EdgeInsets.zero, // Remove padding around the image
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Remove corner radius
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/welcome_page_start.png', // Path to your logo image
                    height: 50, // Adjust the size of the logo as needed
                    width: 287,
                  )),

              SizedBox(
                  height: 5), // Space between the button and the image below

              // Background Image

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double
                        .infinity, // Adjust the height of the background image
                    child: Image.asset(
                      'assets/images/torpok.png', // Path to your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
