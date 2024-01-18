import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required bool success,
}) {
  return showTopSnackBar(
    Overlay.of(context),
    success== true
        ? CustomSnackBar.success(
            message: message,
          )
        : CustomSnackBar.error(
            message: message,
          ),
  );
}
