import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';
class BackBtn extends StatelessWidget {
  final VoidCallback?  onPress;
  const BackBtn({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15.0,
      left: 15.0,
      child: GestureDetector(
        onTap: onPress,
        child: const Icon(
          Icons.arrow_back,
          color: primaryDark,
          size: 33.0,
        ),
      ),
    );
  }
}