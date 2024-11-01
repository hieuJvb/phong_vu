import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: media.height * 0.01),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
