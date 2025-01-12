import 'package:flutter/material.dart';

GestureDetector SelectButtonsInPosting(List<String> name, List<String> selected,
    int index, VoidCallback onTap, Color pointColor, Color backgroundColor) {
  final String text = name[index];
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 80,
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected.contains(text) ? pointColor : backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: selected.contains(text) ? FontWeight.w600 :FontWeight.w400,
            color: selected.contains(text) ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}