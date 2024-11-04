import 'package:flutter/material.dart';
import 'package:brico_voisin/screen/listing_product.dart';

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
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
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
            color: Colors.black, // Couleur de l'ombre
            blurRadius: 0, // Flou de l'ombre
            offset: const Offset(10, 15), // Décalage de l'ombre (x, y)
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'CONNEXION',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'AkiraExpanded',
              ),
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
            ElevatedButton(
              child: const Text('Connecte-toi'),
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD4AB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Mot de passe oublié?'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('G'),
                  onPressed: () {
                    // Action pour Google
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD4AB),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Apple'),
                  onPressed: () {
                    // Action pour Apple
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD4AB),
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black, width: 2),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 0,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        border: InputBorder.none, // Supprimer la bordure par défaut
        contentPadding: const EdgeInsets.all(15), // Padding interne
      ),
      validator: validator,
      onSaved: onSaved,
    ),
  );
}




  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Ici, vous pouvez utiliser _email et _password pour la logique de connexion
      print('Email: $_email, Password: $_password');
      Navigator.push(
        context,
         MaterialPageRoute(
         builder: (context) => const MyListingProduct(),
        ),
          );
    }
  }
}