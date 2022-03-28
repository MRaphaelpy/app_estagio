import 'package:app_estagio/pages/login_page/login_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundColor:const Color(0xFF201A30),
      loaderColor: Colors.white,
      logo: Image.asset("images/bird.png"),
      title: const Text(
        "FLUTTER APPLICATION",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      loadingText: const Text(
        "Flutter Application - Todos os direitos reservados",
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
      navigator: const Login_Page(),
      showLoader: true,
    );
  }
}
