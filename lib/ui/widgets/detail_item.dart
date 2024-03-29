import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';

class DetailItem extends StatelessWidget {
  final String field;
  final String value;
  const DetailItem({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              field,
              style: kDetailFieldTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: kDetailValueTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}