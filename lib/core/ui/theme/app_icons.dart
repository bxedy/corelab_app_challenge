import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const _path = "assets/icons";

  static const announce = "$_path/announce.svg";
  static const categories = "$_path/categories.svg";
  static const favorite = "$_path/favorite.svg";
  static const home = "$_path/home.svg";
  static const user = "$_path/user.svg";
}

extension AppIconsExt on String {
  AppIcon icon({
    String? icon,
    BoxFit? fit,
    Color? color,
    double? width,
    double? height,
    Function()? onTap,
  }) {
    return AppIcon(
      icon: this,
      fit: fit,
      color: color,
      width: width,
      height: height,
      onTap: onTap,
    );
  }
}

class AppIcon extends StatelessWidget {
  final String? icon;
  final BoxFit? fit;
  final Color? color;
  final double? height;
  final double? width;
  final Function()? onTap;

  const AppIcon({
    Key? key,
    this.icon,
    this.fit,
    this.color,
    this.height,
    this.width,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 20,
        width: width ?? 20,
        child: SvgPicture.asset(
          icon ?? AppIcons.home,
          fit: fit ?? BoxFit.contain,
          color: color,
          width: width ?? 20,
          height: height ?? 20,
        ),
      ),
    );
  }
}
