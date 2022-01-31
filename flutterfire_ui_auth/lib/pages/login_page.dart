import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: const SignInScreen(
        providerConfigs: [
          EmailProviderConfiguration(),
        ],
      ),
    );
  }
}
