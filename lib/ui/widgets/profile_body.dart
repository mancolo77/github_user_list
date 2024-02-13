import 'package:flutter/material.dart';
import 'package:github_user_list/data/models/constants.dart';
import 'package:github_user_list/data/models/user_profile.dart';
import 'package:github_user_list/ui/widgets/back_button.dart';
import 'package:github_user_list/ui/widgets/bio.dart';
import 'package:github_user_list/ui/widgets/detail_item.dart';
import 'package:github_user_list/ui/widgets/following_followers.dart';
import 'package:github_user_list/ui/widgets/image_caption.dart';
import 'package:github_user_list/ui/widgets/items_card.dart';
import 'package:github_user_list/ui/widgets/repo_gist.dart';

class ProfileBody extends StatelessWidget {
  final UserProfile data;
  const ProfileBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 0, bottom: 30.0, right: 0, left: 0),
      children: <Widget>[
        Container(
          height: 250.0,
          padding: const EdgeInsets.only(top: 35.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: kDecorationImage,
          ),
          child: Stack(
            clipBehavior: Clip.none, children: <Widget>[
              BackBtn(
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Positioned(
                height: 100.0,
                left: 30.0,
                right: 30.0,
                bottom: -45.0,
                child: Container(
                  padding: const EdgeInsets.only(right: 15.0),
                  decoration: const BoxDecoration(
                      color: primaryDark,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x25000000),
                          blurRadius: 10.0,
                          spreadRadius: 6,
                          offset: Offset(0, 5.0),
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FollowingsAndFollowers(
                        value: data.followers.toString(),
                        field: 'Подписчиков',
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      FollowingsAndFollowers(
                        value: data.following.toString(),
                        field: 'Подписок',
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40.0,
                bottom: -30.0,
                child: ImageCaption(
                  username: data.username,
                  imageUrl: data.avatarUrl,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 70.0,
        ),
        /**
         * End of top user caption.
         * Beginning of user details
         */
        ItemsCard(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              DetailItem(
                field: 'Имя',
                value: data.name,
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Компания',
                value: data.company,
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Локация',
                value: data.location,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        /**
         * End of Details.
         * Beginning of repoGist data.
         */
        RepoGist(
          repoCount: data.publicRepos.toString(),
          gistCount: data.publicGists.toString(),
        ),
        const SizedBox(
          height: 15,
        ),
        /**
         * End of user repoGist.
         * Beginning of bio.
         */
        Bio(bio: data.bio),
      ],
    );
  }
}
