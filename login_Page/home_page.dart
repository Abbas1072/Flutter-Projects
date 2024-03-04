import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.red, Colors.indigo],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Username", username),
            const SizedBox(height: 20),
            _inputField("Password", password),
            const SizedBox(height: 50),
            _button(),
            const SizedBox(height: 20),
            _text(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: border,
        enabledBorder: border,
      ),
      obscureText: hintText.toLowerCase() == 'password',
    );
  }

  Widget _button() {
    return ElevatedButton(onPressed: () {
      debugPrint("Username :${username.text}");
      debugPrint("Password :${password.text}");
    },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const SizedBox(width: double.infinity,
        child: Text('Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize:25),
        ),
      ),
    );
  }

  Widget _text(){
    return const Text("Can't access to your account",
      style: TextStyle(fontSize: 20,color: Colors.white),
    );
  }
}
