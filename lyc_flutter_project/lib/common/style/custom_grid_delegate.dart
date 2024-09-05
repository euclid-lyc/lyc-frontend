import 'package:flutter/material.dart';

SliverGridDelegateWithFixedCrossAxisCount customGridDelegate() {
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 15,
    childAspectRatio: 3 / 4,
  );
}