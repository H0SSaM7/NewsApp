import 'package:flutter/material.dart';

class MyShimmerWidget extends StatelessWidget {
  const MyShimmerWidget({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
