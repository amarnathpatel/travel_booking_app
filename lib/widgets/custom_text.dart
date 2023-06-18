import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';
import '../utils/colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Text(title,
            style: TextStyles.regular2.copyWith(color: black)));
  }
}
