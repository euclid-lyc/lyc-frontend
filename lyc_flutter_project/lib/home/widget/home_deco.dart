import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiniBox extends StatelessWidget {
  const MiniBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15);
  }
}

class DescriptTitle extends StatelessWidget {
  final String label;

  const DescriptTitle({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

class DescriptText extends StatelessWidget {
  final String label;

  const DescriptText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff353945),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xffE4E4E4),
      thickness: 2,
    );
  }
}

class TitleRow extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const TitleRow({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icon_plus.svg',
            color: const Color(0xffA6A6A6),
          ),
        ),
      ],
    );
  }
}

class MarginBox extends StatelessWidget {
  const MarginBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 60);
  }
}
