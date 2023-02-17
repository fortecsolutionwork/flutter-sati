import 'package:flutter/material.dart';
import 'package:sati/constants/colors.dart';

class ButtonSati extends StatefulWidget {
  final String? title;
  final VoidCallback onPress;
  const ButtonSati({super.key, this.title, required this.onPress});

  @override
  State<ButtonSati> createState() => _ButtonSatiState();
}

class _ButtonSatiState extends State<ButtonSati> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
