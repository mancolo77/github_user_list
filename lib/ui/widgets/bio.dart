import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';
import 'package:github_user_list/ui/widgets/items_card.dart';

class Bio extends StatelessWidget {
  final String bio;
  const Bio({super.key, required this.bio});

  @override
  Widget build(BuildContext context) {
    return ItemsCard(
      margin: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Text(
              'О себе:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryLight,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              bio != null ? bio.trim() : kNotProvided,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}