import 'package:brico_voisin/widget/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:brico_voisin/widget/delayed_animation.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showLogin = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLogin() {
    setState(() {
      _showLogin = !_showLogin;
      if (_showLogin) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFB020),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 90),
                  Delayanimation(
                    delay: 1500,
                    child: Image.asset("assets/images/Bricovoisins.png",
                        width: 262),
                  ),
                  const SizedBox(height: 40),
                  Delayanimation(
                    delay: 1500,
                    child: Image.asset("assets/images/logindecoration.png",
                        width: 575),
                  ),
                  const SizedBox(height: 40),
                  Delayanimation(
                    delay: 1000,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text(
                        "PARTAGEZ, LOUEZ, CONSTRUISEZ L'AVENIR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'AkiraExpanded',
                        ),
                      ),
                    ),
                  ),
                  Delayanimation(
                    delay: 4500,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD4AB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          shadowColor: Colors.black,
                          elevation: 10,
                        ),
                        child: const Text(
                          'Inscrivez-vous',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'Sora',
                          ),
                        ),
                        onPressed: () {
                          // Navigation vers la page d'inscription
                        },
                      ),
                    ),
                  ),
                  Delayanimation(
                    delay: 0,
                    child: Text.rich(
                      TextSpan(
                        text: "Déjà inscrit ? ",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Sora',
                        ),
                        children: [
                          TextSpan(
                            text: "Connectez-vous",
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Sora',
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _toggleLogin,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showLogin)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleLogin,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          if (_showLogin)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Transform.translate(
                offset: Offset(
                    0,
                    _animation.value *
                        MediaQuery.of(context).size.height *
                        0.7),
                child: LoginForm(),
              ),
            ),
        ],
      ),
    );
  }
}
