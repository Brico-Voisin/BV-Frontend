import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brico_voisin/screen/AuthScreen.dart';
import 'package:brico_voisin/screen/listing_product.dart';
import 'package:brico_voisin/widget/navigation_menu.dart';
import 'package:brico_voisin/utilities/page_manager.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFFFFECDA),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0,
              offset: const Offset(10, 15),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu
                crossAxisAlignment: CrossAxisAlignment.center, // Centre verticalement
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(), // Naviguer vers la page d'accueil
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/images/arrow-left.svg',
                      height: 32,
                    ),
                  ),
                  const SizedBox(width: 8), // Espacement entre l'icône et le texte
                  const Text(
                    'CONNEXION',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AkiraExpanded',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField(
                hint: 'Email',
                icon: Icons.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value ?? '',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                hint: 'Mot de passe',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                onSaved: (value) => _password = value ?? '',
              ),
              const SizedBox(height: 20),
              _buildElevatedButton(
                text: 'Connecte-toi',
                onPressed: _submitForm,
              ),
              const SizedBox(height: 15),
              const Text(
                'Mot de passe oublié ?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Sora',
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildSvgButton(
                      asset: 'assets/images/google.svg',
                      onPressed: () {
                        // Action pour Google
                      },
                    ),
                  ),
                  const SizedBox(width: 16), // Espacement entre les boutons
                  Expanded(
                    child: _buildSvgButton(
                      asset: 'assets/images/apple.svg',
                      onPressed: () {
                        // Action pour Apple
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFECDA),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(25),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildElevatedButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFF5935),
        borderRadius: BorderRadius.circular(18), // Bordure arrondie
        border: Border.all(color: Colors.black, width: 2), // Bordure noire
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: const Offset(3, 3), // Ombre
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold, // Mettre le texte en gras
            color: Colors.black, // Couleur du texte en noir
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5935), // Couleur de fond
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100), // Padding
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildSvgButton({
    required String asset,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFD4AB),
        borderRadius: BorderRadius.circular(18), // Bordure arrondie
        border: Border.all(color: Colors.black, width: 2), // Bordure noire
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0,
            offset: const Offset(3, 3), // Ombre
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD4AB), // Couleur de fond
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0), // Padding
          elevation: 0, // Supprime l'élévation
        ),
        child: SvgPicture.asset(
          asset,
          height: 25,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email: $_email, Password: $_password');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationMenu(
            pages: PageManager.getPages(),
          ),
        ),
      );
    }
  }
}
