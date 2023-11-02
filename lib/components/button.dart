import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  void Function()? function;
  final text;
  Button({super.key, required this.function, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0,bottom: 8.0,right: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade800, fixedSize: const Size(100, 50)),
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
