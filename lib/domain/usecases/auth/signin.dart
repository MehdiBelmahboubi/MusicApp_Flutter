import 'package:dartz/dartz.dart';
import 'package:music_app_flutter/core/configs/usecase/usecase.dart';
import 'package:music_app_flutter/data/models/auth/signin_user_request.dart';
import 'package:music_app_flutter/domain/repository/auth/auth.dart';
import 'package:music_app_flutter/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserRequest>{
  @override
  Future<Either> call({SigninUserRequest ? params}) {
    return sl<AuthRepository>().signInWithEmailAndPassword(params!);
  }
}