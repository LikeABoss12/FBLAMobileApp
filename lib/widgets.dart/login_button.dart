import 'package:flutter/material.dart';

import '../pallate.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key, required this.buttonText,
  });
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepOrange.withOpacity(0.80),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            buttonText,
            style: kBodyText,
          ),
        ),
      ),
    );
  }
}