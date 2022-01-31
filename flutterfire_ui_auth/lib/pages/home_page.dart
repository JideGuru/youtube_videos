import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      providerConfigs: [EmailProviderConfiguration()],
      avatarSize: 70.0,
    );
  }
}
