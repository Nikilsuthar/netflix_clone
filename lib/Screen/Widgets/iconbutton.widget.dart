import 'package:flutter/material.dart';

class IconTextColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;
  final double iconSize;
  final double textSize;
  final VoidCallback onTap;

  const IconTextColumn({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    required this.iconSize,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
