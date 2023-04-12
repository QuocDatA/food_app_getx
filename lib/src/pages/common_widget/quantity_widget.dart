import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {

  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    Key? key,
    required this.value,
    required this.suffixText, 
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ]
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete, 
            color: !isRemovable || value > 1? Colors.grey : Colors.red,
            onPressed: () {
              if(value == 1 && !isRemovable) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: CustomColor.customSwatchColor,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          )
        ]),
    );
  }
}

class _QuantityButton extends StatelessWidget {

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.icon,
    required this.color, 
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}