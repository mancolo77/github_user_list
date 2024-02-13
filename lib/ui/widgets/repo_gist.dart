import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_user_list/generated/locale_keys.g.dart';
import 'package:github_user_list/ui/widgets/following_followers.dart';
import 'package:github_user_list/ui/widgets/items_card.dart';

class RepoGist extends StatelessWidget {
  final String repoCount;
  final String gistCount;
  const RepoGist({super.key, required this.repoCount, required this.gistCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Expanded(
          child: ItemsCard(
            margin: const EdgeInsets.only(
              left: 15.0,
            ),
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 30,
              ),
            child: FollowingsAndFollowers(
              field: LocaleKeys.Repos.tr(),
              value: repoCount,
            )
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: ItemsCard(
              margin: const EdgeInsets.only(
                right: 15.0,
              ),
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 30,
              ),
              child: FollowingsAndFollowers(
                field: LocaleKeys.Gists.tr(),
                value: gistCount,
              )
          ),
        )
      ],
    );
  }
}