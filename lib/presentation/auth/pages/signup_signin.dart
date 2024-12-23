import 'package:flutter/material.dart';
import 'package:music_app_flutter/common/widgets/button/basic_app_button.dart';
import 'package:music_app_flutter/core/configs/assets/app_images.dart';
import 'package:music_app_flutter/presentation/chose_mode/pages/chose_mode.dart';

class SignupSigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image or color
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.signupOrSignin),
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Add some space from the top
                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Add some space between the texts
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Join us and enjoy a seamless musical journey.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(), // Pushes the buttons to the bottom
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BasicAppButton(
                        onPressed: () {
                          
                        },
                        title: 'Register',
                        textColor: Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                      BasicAppButton(
                        onPressed: () {
                          // Add your onPressed logic for Sign In here
                        },
                        title: 'Sign In',
                        textColor: Colors.blue,
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