import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                return null;
              },
              onSaved: (value) => _email = value ?? '',
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Mot de passe',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
                    //onPrimary: Colors.black,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Apple'),
                  onPressed: () {
                    // Action pour Apple
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD4AB),
                    //onPrimary: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Ici, vous pouvez utiliser _email et _password pour la logique de connexion
      print('Email: $_email, Password: $_password');
      // Ajoutez votre logique de connexion ici
    }
  }
}