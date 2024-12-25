import 'package:music_app_flutter/core/configs/usecase/usecase.dart';
import 'package:music_app_flutter/data/models/auth/create_user_request.dart';
import 'package:dartz/dartz.dart';
import 'package:music_app_flutter/domain/repository/auth/auth.dart';
import 'package:music_app_flutter/service_locator.dart'; // Importing the Either type from dartz package

class SignupUseCase implements Usecase<Either, CreateUserRequest> {
  
  @override
  Future<Either> call({CreateUserRequest ? params}) {
    return sl<AuthRepository>().signUpWithEmailAndPassword(params!);
  }
  
}