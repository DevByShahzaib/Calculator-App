import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  MyButton({super.key,
    required this.title,
    this.color = Colors.orange,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            width: 50,
            height: 80,
            child: Center(child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white),)),
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
            ),
          ),
        ),
      ),
    );

  }
}