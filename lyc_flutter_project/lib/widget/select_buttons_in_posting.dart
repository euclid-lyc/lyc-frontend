import 'package:flutter/material.dart';

GestureDetector SelectButtonsInPosting(List<String> name, List<String> selected,
    int index, VoidCallback _onTap, Color pointColor, Color backgroundColor) {
  final String _text = name[index];
  return GestureDetector(
    onTap: _onTap,
    child: Container(
      height: 50,
      width: 80,
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected.contains(_text) ? pointColor : backgroundColor,
        ),
        child: Text(
          _text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: selected.contains(_text) ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}