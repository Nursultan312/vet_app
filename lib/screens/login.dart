import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet/forgot_password/email_enter.dart';
import 'package:vet/main.dart';
import 'package:vet/screens/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers for the text fields
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form validation keys
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Phone Number Input

              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password page (if exists)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text(
                      'Өткөрүп жиберүү',
                      style: TextStyle(
                        color: Color(0x0FF01A560),
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password page (if exists)
                    },
                    child: Text(
                      'Сиздин номериңиз',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 310, // Set the width to 300
                height: 48,
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: '996 123 456 789',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.green, // Set the border color to green
                        width:
                            1.5, // Set the border width to a smaller value (adjust as needed)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors
                            .green, // Set the focused border color to green
                        width:
                            1.5, // Make the focused border slightly thicker (adjust as needed)
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone,
                        color: Colors.grey), // Set icon color to green
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password page (if exists)
                    },
                    child: Text(
                      'Сыр сөз',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 310, // Set the width to 300
                height: 48,
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: '*********',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.green, // Set the border color to green
                        width:
                            1.5, // Set the border width to a smaller value (adjust as needed)
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors
                            .green, // Set the focused border color to green
                        width:
                            1.5, // Make the focused border slightly thicker (adjust as needed)
                      ),
                    ),
                    prefixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: Colors.grey), // Set icon color to green
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password page (if exists)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmailEnter()),
                      );
                    },
                    child: const Text(
                      'Сыр сөзду унуттуңузбу?',
                      style: TextStyle(
                        color: Color(0x0FF01A560),
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process login
                    String phoneNumber = _phoneController.text;
                    String password = _passwordController.text;

                    // Handle login logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logging in with $phoneNumber')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0, // Remove the shadow by setting elevation to 0
                  padding: EdgeInsets
                      .zero, // Optional: If you want to remove any padding inside the button
                  backgroundColor: Colors
                      .transparent, // Optional: To make the background transparent (if needed)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // Optional: Set the button's shape (no rounded corners here)
                  ),
                ),
                child: Container(
                  width: 310, // Adjust the width of the button as needed
                  height: 48, // Adjust the height of the button as needed
                  decoration: BoxDecoration(
                    color: Colors
                        .green, // Background color of the button (green in this case)
                    borderRadius: BorderRadius.circular(
                        30), // Rounded corners for the button
                  ),
                  child: Stack(
                    children: [
                      // Image behind the text
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/login.png', // Path to your logo image
                          fit: BoxFit
                              .cover, // Makes sure the image fills the container
                        ),
                      ),
                      // Text on top of the image
                      const Center(
                        child: Text(
                          'Кирүү', // Your text here
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors
                                .white, // Text color is white for contrast
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Аккаунтуңуз жокпу? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        TextSpan(
                          text: 'Ушул жерден катталыңыз.',
                          style: const TextStyle(
                            color: Color(
                                0xFF01A560), // Color for the clickable text
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to another page when clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 20), // Adds space between the form and the image

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Divider(
                      color: Color(0xFF01A560),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Же', // Text in the middle
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Divider(
                      color: Color(0xFF01A560),
                    ), // Right divider
                  ),
                ],
              ),

              //const SizedBox(height: 20), // Add space between widgets
              // Text("Widget 2")

              GestureDetector(
                onTap: () {
                  // Replace with the URL you want to open
                  _launchURL('https://accounts.google.com/Login');
                },
                child: Image.asset(
                  'assets/images/google.png', // Path to your image
                  width: 132, // Adjust size as needed
                  height: 48, // Adjust size as needed
                  fit: BoxFit.cover, // Fit the image to the container
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
