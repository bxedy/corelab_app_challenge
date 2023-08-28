import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
}) {
  final snackBar = SnackBar(
    backgroundColor: AppColors.defaultCyan,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    content: Text(
      message,
    ),
    duration: const Duration(seconds: 1),
  );

  ScaffoldMessenger.of(context)
      .showSnackBar(snackBar)
      .closed
      .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
}
