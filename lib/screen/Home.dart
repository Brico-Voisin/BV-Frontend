import 'package:brico_voisin/theme/colors.dart';
import 'package:brico_voisin/widget/delayed_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFB020),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: SizedBox(
              child: Column(children: [
                const SizedBox(
                  height: 90,
                ),
                Delayanimation(
                  delay: 1500,
                  child:
                      Image.asset("assets/images/Bricovoisins.png", width: 262),
                ),
                const SizedBox(
                  height: 40,
                ),
                Delayanimation(
                  delay: 1500,
                  child: Image.asset("assets/images/logindecoration.png",
                      width: 575),
                ),
                const SizedBox(
                  height: 40,
                ),
                Delayanimation(
                  delay: 1000,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
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
                        vertical: 24,
                        horizontal: 24,
                      ), //height: 70,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFFFD4AB), // Couleur de fond #FFD4AB
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                  color: Colors.black,
                                  width: 2) // Coins arrondis
                              ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          shadowColor: Colors.black, // Couleur de l'ombre
                          elevation: 10, // Hauteur de l'ombre
                        ),
                        child: const Text(
                          'Inscrivez-vous',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: 'Sora'),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Inscription(),
                          //     ));
                        },
                      ),
                    )),
                Delayanimation(
                    delay: 0,
                    child: Text.rich(
                      TextSpan(
                        text: "Déjà inscrit ? ", // Texte normal
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Sora',
                        ),
                        children: [
                          TextSpan(
                            text: "Connectez-vous", // Texte souligné et en gras
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, // Gras
                                decoration: TextDecoration.underline,
                                fontFamily: 'Sora' // Souligné
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Action pour le clic, actuellement vide
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ))
              ]),
            )),
          ],
        ));
  }
}
