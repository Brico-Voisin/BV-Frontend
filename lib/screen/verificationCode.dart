import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String email;

  const VerificationCodeScreen({super.key, required this.email});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  bool _isLoading = false;

  Future<void> _verifyOtp() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final otp = _controllers.map((controller) => controller.text.trim()).join();

    if (otp.length != 6) {
      scaffoldMessenger.showSnackBar(
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
        Navigator.pop(context);
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
    backgroundColor: const Color(0xFFFFDDBD),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Center( 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/Bricovoisins.png", width: 150),
            ),
            const SizedBox(height: 24),
            const Text(
              'Vérification OTP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'Saisissez le code de vérification que nous\nvenons de vous envoyer',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child : Flexible( 
                  child: _buildOtpBox(index),
                  ),
                  );          
                }),
            ),
            const Spacer(),
            _isLoading
                ? const CircularProgressIndicator()
                : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.black, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: _verifyOtp,
                      child: const Text(
                        'Vérifier',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildOtpBox(int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1.0),
    decoration: BoxDecoration(
      color: const Color(0xFFFFDDBD),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.black, width: 1),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 0,
          offset: Offset(3, 3),
        ),
      ],
    ),
    child: SizedBox(
      width: 50, 
      height: 50,
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(fontSize: 24),
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
  }

}
