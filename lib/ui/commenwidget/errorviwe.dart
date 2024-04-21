
import 'package:flutter/material.dart';

class errprviwe extends StatelessWidget {
   errprviwe({
    super.key,
    required this.error,
    required this.refresh
  });

  final String error;
 final Function? refresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(error)),
        Center(
          child: ElevatedButton(
            onPressed: () {
              refresh?.call();
            },
            child: Text("Refresh"),
          ),
        ),
      ],
    );
  }

}