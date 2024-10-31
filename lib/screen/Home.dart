import 'package:brico_voisin/theme/colors.dart';
import 'package:brico_voisin/widget/delayed_animation.dart';
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
            child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(children: [
            const SizedBox(
              height: 200,
            ),
            Delayanimation(
              delay: 1500,
              child: Image.asset("assets/images/Bricovoisins.png"),
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
                  "La seule app qui recréer du ien convivial",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Delayanimation(
                delay: 4500,
                child: SizedBox(
                  //height: 70,
                  //width: 200,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainColor.primaryColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      'CONNEXION',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: MainColor.secondaryColor),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Login(),
                      //     ));
                    },
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Delayanimation(
                delay: 4500,
                child: SizedBox(
                  //height: 70,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainColor.primaryColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      'INSCRIPTION',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: MainColor.secondaryColor),
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
            const SizedBox(
              height: 20,
            ),
          ]),
        )),
      ],
    ));
  }
}
