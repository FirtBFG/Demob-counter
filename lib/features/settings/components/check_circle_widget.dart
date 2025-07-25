import 'package:flutter/material.dart';

class CheckCircle extends StatelessWidget {
  const CheckCircle({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isSelected ? Colors.lightBlueAccent : Colors.black.withAlpha(100),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: isSelected
          ? Icon(Icons.check)
          : Icon(
              Icons.abc,
              color: Colors.transparent,
            ),
    );
  }
}
