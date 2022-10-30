// ignore_for_file: prefer_const_constructors

import 'package:feed/modules/data/post_informations.dart';
import 'package:feed/shared/themes/appColors.dart';
import 'package:feed/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.shape,
      body: Column(
        children: [
          Container(
            height: 120,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    "assets/images/perfil.jpg",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Container(
                        child: Center(
                  child: Text(
                    "ClassDojo",
                    style: AppTextStyles.titleBoldHeading,
                  ),
                ))),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 5),
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 35,
                    icon: Icon(Icons.notifications),
                    color: AppColors.heading,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: List.generate(
                  Post.users.length,
                  (index) => post(
                      userName: Post.users[index]["user"]["name"],
                      postDate: Post.post[index]["post"]["date"],
                      postComment: Post.post[index]["post"]["comment"],
                      postImage: Post.post[index]["post"]["picture"],
                      userImage: Post.users[index]["user"]["picture"])),
            ),
          )

          /*post(
              userName: Post.users[0]["user"]["name"],
              postDate: Post.post[0]["post"]["date"],
              postImage: Post.post[0]["post"]["picture"],
              userImage: Post.users[0]["user"]["picture"])*/
        ],
      ),
    );
  }

  Widget post({
    required String userImage,
    required String userName,
    required String postDate,
    required String postComment,
    required String postImage,
  }) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: 470,
        child: Column(children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      userImage,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: AppTextStyles.titleBoldHeading),
                  Text(postDate, style: AppTextStyles.captionBody),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: size.width,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(postImage), fit: BoxFit.cover)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  postComment,
                  style: AppTextStyles.captionBody,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "2 gostos",
                        style: AppTextStyles.captionBoldBody,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "2 comentários",
                        style: AppTextStyles.captionBoldBody,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
