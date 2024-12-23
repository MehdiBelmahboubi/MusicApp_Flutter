import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_flutter/common/widgets/button/basic_app_button.dart';
import 'package:music_app_flutter/core/configs/assets/app_images.dart';
import 'package:music_app_flutter/core/configs/assets/app_vectors.dart';
import 'package:music_app_flutter/presentation/auth/pages/signup_signin.dart';
import 'package:music_app_flutter/presentation/chose_mode/bloc/theme_cubit.dart';

class ChoseModePage extends StatelessWidget {
  const ChoseModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image or color
          Container(
            decoration: const BoxDecoration(
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
                  const SizedBox(height: 50), // Add some space from the top
                  const Text(
                    'Chose Mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30), // Add some space between the texts
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>{
                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark)
                          } ,
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.5),
                                  shape: BoxShape.circle
                                ),
                                child: Image.asset(AppVectors.moon),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text('Dark Mode', style: 
                          TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white
                        )),
                      ],
                    ),
                    const SizedBox(width: 80),
                     Column(
                      children: [
                        GestureDetector(
                          onTap: () =>{
                            context.read<ThemeCubit>().updateTheme(ThemeMode.light)
                          } ,
                          child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset(AppVectors.sun),
                            ),
                           ),
                          ),
                         ),
                         const SizedBox(height: 15),
                         const Text('Light Mode', style: 
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
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignupSigninPage(),
                      ),
                    );
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