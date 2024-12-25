import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_app_flutter/core/configs/theme/app_theme.dart';
import 'package:music_app_flutter/presentation/chose_mode/bloc/theme_cubit.dart';
import 'package:music_app_flutter/presentation/splash/pages/splash.dart';
import 'package:music_app_flutter/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDh2G9jkBGYZsqCbVuN2SbsthTxNP2p7o8",
            appId: "1:577440510376:android:0ed96e73fa4e2e7f576d9d",
            messagingSenderId: "577440510376",
            projectId: "577440510376"
        )
    ); // Initialisation Firebase

    print("Firebase initialisé avec succès !");
  } catch (e) {

    print("Erreur${e}");
  }
  await Firebase.initializeApp();
  await initializeDependencies();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: SplashPage()
        ),
      ),
    );
  }
}
