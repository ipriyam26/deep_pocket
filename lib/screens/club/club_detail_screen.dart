// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:deep_pocket_1/screens/club/club_models.dart';
import 'club_widgets.dart';

class clubDetail extends StatelessWidget {
  // const clubDetail({Key? key}) : super(key: key);
  static const route = '/club-screen/club-detail';

  const clubDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var details = ModalRoute.of(context)!.settings.arguments as club;
    var MSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          stackDetail(details: details, MSize: MSize),
          SizedBox(
            height: MSize.height * 0.02,
          ),
          CarouselSlider(
            options: CarouselOptions(
                // aspectRatio: 20 / 9,
                viewportFraction: 0.99,
                enableInfiniteScroll: false,
                height: MSize.height * 0.7 * 0.6,
                initialPage: 0),
            items: [0, 1].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MSize.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: i == 0
                        ? hostclub(MSize: MSize, details: details)
                        : hostDetails(MSize: MSize, details: details),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
