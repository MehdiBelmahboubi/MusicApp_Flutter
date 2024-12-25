
import 'package:dartz/dartz.dart';
import 'package:music_app_flutter/data/models/auth/create_user_request.dart';
import 'package:music_app_flutter/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signInWithEmailAndPassword(SigninUserRequest signinUserReq);

  Future<Either> signUpWithEmailAndPassword(CreateUserRequest createUserRequest);

  Future<Either> signOut();
}