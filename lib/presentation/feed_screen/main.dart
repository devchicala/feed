// ignore_for_file: prefer_const_constructors

import 'package:feed/data/post_informations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    "assets/images/2_user.jpg",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Text('A escrever ...')),
                  margin: EdgeInsets.only(left: 5),
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                )),
                Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5),
                    child: SvgPicture.asset(
                      "assets/svg/foto.svg",
                    ))
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
    required String postImage,
  }) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 452,
      color: Colors.orangeAccent,
      child: Column(
        children: [
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
                  Text(userName),
                  Text(postDate),
                ],
              )),
              Padding(
                  padding: const EdgeInsets.only(right: 10, left: 5),
                  child: SvgPicture.asset(
                    "assets/svg/foto.svg",
                  ))
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
          )
        ],
      ),
    );
  }
}
