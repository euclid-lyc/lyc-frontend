import 'package:flutter/material.dart';

class PostingContentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const PostingContentTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
