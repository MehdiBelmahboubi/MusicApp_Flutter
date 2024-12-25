import 'package:dartz/dartz.dart';
import 'package:music_app_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:music_app_flutter/domain/repository/auth/auth.dart';
import 'package:music_app_flutter/service_locator.dart';

class AuthRepostoryImpl extends AuthRepository{
  @override
  Future<Either> signInWithEmailAndPassword(signinUserReq) async {
    return await sl<AuthFirebaseService>().signInWithEmailAndPassword(signinUserReq);
  }

  @override
  Future<Either> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either> signUpWithEmailAndPassword(createUserRequest) async {
   return await sl<AuthFirebaseService>().signUpWithEmailAndPassword(createUserRequest);
  }
  
}