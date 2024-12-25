import 'package:get_it/get_it.dart';
import 'package:music_app_flutter/data/repository/auth/auth_repostory_impl.dart';
import 'package:music_app_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:music_app_flutter/domain/repository/auth/auth.dart';
import 'package:music_app_flutter/domain/usecases/auth/signin.dart';
import 'package:music_app_flutter/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  // sl.registerSingleton<MusicFirebaseService>(MusicFirebaseServiceImpl());
  // sl.registerSingleton<PlaylistFirebaseService>(PlaylistFirebaseServiceImpl());
  // sl.registerSingleton<SearchFirebaseService>(SearchFirebaseServiceImpl());
  // sl.registerSingleton<UserFirebaseService>(UserFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepostoryImpl());
  // sl.registerSingleton<MusicRepository>(MusicRepositoryImpl());
  // sl.registerSingleton<PlaylistRepository>(PlaylistRepositoryImpl());
  // sl.registerSingleton<SearchRepository>(SearchRepositoryImpl());
  // sl.registerSingleton<UserRepository>(UserRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}