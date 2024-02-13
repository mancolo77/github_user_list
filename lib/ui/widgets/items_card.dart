import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';

class ItemsCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const ItemsCard({super.key, required this.child, required this.margin, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: child,
    );
  }
}