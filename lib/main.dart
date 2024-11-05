import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/config/root_binding.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/pages/signin_page.dart';
import 'package:instagram_clone/pages/signup_page.dart';
import 'package:instagram_clone/pages/splash_page.dart';
import 'package:instagram_clone/services/notif_service.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCCnA9J4LEumtfBo0fmnQqsCQeLSZlTLP0',
      appId: '1:368173211780:android:1947045ee8da38660aa2d1',
      messagingSenderId: '368173211780',
      projectId: 'instaclone-2-4ac0a',
    ),
  );

  await NotifService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashPage(),
      initialBinding: RootBinding(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        HomePage.id: (context) => HomePage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}
