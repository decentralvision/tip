import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip/styles/colors.dart';

class TipButton extends StatelessWidget {
  final String? title;
  final Function? onPressed;
  const TipButton({
    this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.primary)),
        child: Text(title!),
        onPressed: () => onPressed!()
      ),
    );
  }
}