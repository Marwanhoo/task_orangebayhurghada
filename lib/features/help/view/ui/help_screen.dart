import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Help Screen", style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
