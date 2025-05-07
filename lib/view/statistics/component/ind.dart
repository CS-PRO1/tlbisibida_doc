import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.value,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String value;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: isSquare ? BorderRadius.circular(5) : null,
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cyan600,
              )),
          Text(
            value,
            style: TextStyle(
              color: cyan500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
