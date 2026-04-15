import 'package:flutter/material.dart';
import 'package:notes_application/widget/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.text, required this.icon, this.onPressed});

  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 28, color: Colors.white)),
        CustomSearchIcon(
          
          onPressed: onPressed,
        
        icon: icon),
      ],
    );
  }
}
