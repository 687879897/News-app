
import 'package:flutter/material.dart';

class errprviwe extends StatelessWidget {
  const errprviwe({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(error),
        ElevatedButton(
          onPressed: () {},
          child: Text("Refresh"),
        ),
      ],
    );
  }
}