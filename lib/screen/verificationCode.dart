import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String email; // Passez l'email de l'utilisateur pour la vérification

  VerificationCodeScreen({Key? key, required this.email}) : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;

  Future<void> _verifyOtp() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final otp = _codeController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un code de 6 chiffres.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Supabase.instance.client.auth.verifyOTP(
        token: otp,
        type: OtpType.signup,
        email: widget.email,
      );

      if (response.user != null) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Vérification réussie !')),
        );
        Navigator.pop(context); // Rediriger vers la page de connexion ou d'accueil
      } else {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Erreur de vérification. Veuillez réessayer.')),
        );
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Erreur: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vérification Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Entrez votre code ',
              ),
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _verifyOtp,
                    child: const Text('Vérifier'),
                  ),
          ],
        ),
      ),
    );
  }
}
