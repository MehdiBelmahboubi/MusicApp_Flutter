import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app_flutter/common/widgets/button/basic_app_button.dart';
import 'package:music_app_flutter/core/configs/assets/app_images.dart';
import 'package:music_app_flutter/core/configs/assets/app_vectors.dart';

class ChoseModePage extends StatelessWidget {
  const ChoseModePage({Key? key}) : super(key: key);

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
                image: AssetImage(AppImages.choseModeImage),
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 50), // Add some space from the top
                  Text(
                    'Chose Mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30), // Add some space between the texts
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset(AppVectors.moon),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text('Dark Mode', style: 
                          TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white
                        )),
                      ],
                    ),
                    SizedBox(width: 80),
                     Column(
                       children: [
                         ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset(AppVectors.sun),
                            ),
                          ),
                         ),
                         SizedBox(height: 15),
                         Text('Light Mode', style: 
                          TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white
                        )),
                       ],
                     ),
                  ],
                 )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BasicAppButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  title: 'Continue',
                  textColor: Colors.blue,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}