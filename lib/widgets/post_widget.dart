import 'package:deep_pocket_1/models/data_feed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'picture_name_share.dart';

class postWidget extends StatelessWidget {
  final dataFeed post;

  postWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: const BoxDecoration(
        border: Border(
          // top: BorderSide(width: 1.0, color: Colors.grey),
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: pictureNameShare(post: post)),
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                post.title,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                post.text,
                textAlign: TextAlign.start,
              )),
          Row(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "JOIN CONVERSATION",
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Follow",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 20, bottom: 5),
              width: double.maxFinite,
              child: Text(post.date.substring(0, 11)))
        ],
      ),
    );
  }
}
