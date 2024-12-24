import 'package:flutter/material.dart';
import 'package:music_app_flutter/common/widgets/button/basic_app_button.dart';
import 'package:music_app_flutter/core/configs/assets/app_images.dart';
import 'package:music_app_flutter/core/configs/assets/app_vectors.dart';
import 'package:music_app_flutter/presentation/auth/pages/signin.dart';
import 'package:music_app_flutter/presentation/auth/pages/signup.dart';
import 'package:music_app_flutter/presentation/chose_mode/pages/chose_mode.dart';

class SignupSigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image or color
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
                  AppImages.signupOrSignin // Replace with your background image
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Add some space from the top
                Image.asset(
                  AppVectors.logo,
                  height: 100, // Adjust the height as needed
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Music App',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 14, 92, 157),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Add some space between the texts
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Experience the best music from around the world. '
                    'Join us and enjoy a seamless musical journey.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 50), // Add some space from the bottom
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignupPage()
                            ),
                          );
                        },
                        title: 'Register',
                        textColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 14, 92, 157),
                      ),
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()
                            ),
                          );
                        },
                        title: 'Sign In',
                        textColor: const Color.fromARGB(255, 14, 92, 157),
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}