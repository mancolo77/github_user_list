import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';

class FollowingsAndFollowers extends StatelessWidget {
  final String value;
  final String field;
  const FollowingsAndFollowers({super.key, required this.value, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: const TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            field,
            style: const TextStyle(
              fontSize: 14.0,
              color: secondaryLight,
            ),
          )
        ],
      ),
    );
  }
}