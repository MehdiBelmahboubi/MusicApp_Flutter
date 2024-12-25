import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_app_flutter/data/models/auth/create_user_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app_flutter/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signInWithEmailAndPassword(SigninUserRequest signinUserReq);

  Future<Either> signUpWithEmailAndPassword(CreateUserRequest createUserRequest);

  Future<Either> signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signInWithEmailAndPassword(SigninUserRequest signinUserReq) async {
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email,
          password: signinUserReq.password
      );
      return Right('Sign in successful');
    } on FirebaseAuthException catch(e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either> signUpWithEmailAndPassword(CreateUserRequest createUserRequest) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email,
          password: createUserRequest.password
      );
      FirebaseFirestore.instance.collection('Users').add(
          {
            'name': createUserRequest.fullName,
            'email': data.user?.email
          }
      );

      return Right('Sign up successful');
    } on FirebaseAuthException catch(e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      return Left(errorMessage);
    }
  }
  
}
