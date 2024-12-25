import 'package:flutter/material.dart';
import 'package:music_app_flutter/common/widgets/button/basic_app_button.dart';
import 'package:music_app_flutter/core/configs/assets/app_vectors.dart';
import 'package:music_app_flutter/data/models/auth/create_user_request.dart';
import 'package:music_app_flutter/domain/usecases/auth/signup.dart';
import 'package:music_app_flutter/presentation/auth/pages/signin.dart';
import 'package:music_app_flutter/presentation/root/pages/root.dart';
import 'package:music_app_flutter/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppVectors.logo,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 62, 159, 238),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              _fullNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 30),
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUserRequest(
                      fullName: _fullName.text,
                      email: _email.text,
                      password: _password.text,
                    ),
                  );
                  result.fold(
                    (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                        ),
                      );
                    },
                    (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()
                            ),
                            (route) => false
                      );
                    },
                  );
                },
                title: 'Create Account',
              ),
              _siginText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: InputDecoration(
        hintText: 'Full Name',
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey[350],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey[350],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey[350],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SigninPage()
                            ),
                          );
            },
            child: const Text(
              'Sign In',
              style: TextStyle(color: Color.fromARGB(255, 62, 159, 238)),
            ),
          ),
        ],
      ),
    );
  }
}
