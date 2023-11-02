import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  const TextBox({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
