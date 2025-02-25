import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SpecSizeBox<T> extends StatelessWidget {
  final VoidCallback onTap;
  final int Function(T) getValue;

  const SpecSizeBox({
    super.key,
    required this.onTap,
    required this.getValue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xffE9E9E9),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 20,
            ),
            child: Text(
              getValue(value).toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
