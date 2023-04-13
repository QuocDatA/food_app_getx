import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';

class CategoriesTile extends StatelessWidget {

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoriesTile({
    Key? key, 
    required this.category, 
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? CustomColor.customSwatchColor : Colors.transparent
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : CustomColor.customContrasColor,
              fontSize: isSelected ? 14 : 16,
              fontWeight: FontWeight.bold 
            ),
          ),
        ),
      ),
    );
  }
}