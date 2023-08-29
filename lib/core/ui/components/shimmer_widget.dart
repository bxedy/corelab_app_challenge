import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shapeBorder;
  final Color baseColor;
  final Color highlightColor;
  final double size;
  final double borderRadius;

  const ShimmerWidget.rectangular({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.baseColor = const Color(0xFF99c9ce),
    this.highlightColor = const Color(0xFFb3d7da),
    this.borderRadius = 30,
  })  : shapeBorder = BoxShape.rectangle,
        size = height;

  const ShimmerWidget.circular({
    super.key,
    required this.size,
    this.baseColor = const Color(0xFFDBDDE1),
    this.highlightColor = const Color(0xFFF1F2F3),
  })  : shapeBorder = BoxShape.circle,
        width = size,
        height = size,
        borderRadius = 0;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            shape: shapeBorder,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      );
}
