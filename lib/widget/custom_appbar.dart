import 'package:flutter/material.dart';
import 'package:notes_application/widget/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
        CustomSearchIcon(icon: icon),
      ],
    );
  }
}
