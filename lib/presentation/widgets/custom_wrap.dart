import 'package:flutter/material.dart';

class CustomWrap extends StatelessWidget {
  final Color? color;
  final String? title;

  const CustomWrap({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return Container(
      width: media.width * 0.2,
      height: media.height * 0.05,
      padding: EdgeInsets.all(media.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(
          color: color!
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        textAlign: TextAlign.center,
        title!,
        style: TextStyle(
            color: color!,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
