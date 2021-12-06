// ignore_for_file: camel_case_types

import 'package:deep_pocket_1/models/data_feed.dart';

import 'package:flutter/material.dart';

class pictureNameShare extends StatelessWidget {
  const pictureNameShare({
    Key? key,
    required this.post,
  }) : super(key: key);

  final dataFeed post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(post.imgsrc))),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  Transform(
                    transform: Matrix4.identity()..scale(0.7),
                    child: Chip(
                      label: Text(
                        Tag[post.tag].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[350],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/refreshing.png',
              width: 25,
              height: 25,
              color: Colors.blue,
            ))
      ],
    );
  }
}
