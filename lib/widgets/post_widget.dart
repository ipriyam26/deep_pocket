import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

class newPost extends StatelessWidget {
  static const route = 'newPost';

  final List<String> imagesList = [
    // 'https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/07/01/49/ice-cream-1440830_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/02/25/07/15/food-3179853_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/10/26/11/10/honey-1006972_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final MHeight = MediaQuery.of(context).size.height;
    final MWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: InkWell(
                onTap: () {},
                child: Hero(
                  tag: "xcross",
                  child: postCard(
                      MHeight: MHeight, MWidth: MWidth, imagesList: imagesList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class postCard extends StatefulWidget {
  const postCard({
    Key? key,
    required this.MHeight,
    required this.MWidth,
    required this.imagesList,
  }) : super(key: key);

  final double MHeight;
  final double MWidth;
  final List<String> imagesList;

  @override
  State<postCard> createState() => _postCardState();
}

class _postCardState extends State<postCard> {
  bool liked = false;
  int like = 42;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // color: Colors.amberAccent,
        // height: widget.MHeight * 0.5,
        // width: MWidth * 0.9,
        padding: EdgeInsets.symmetric(
            horizontal: widget.MWidth * 0.05, vertical: widget.MHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            firstColumn(MWidth: widget.MWidth),
            SizedBox(
              height: widget.MHeight * 0.01,
            ),
            Container(
              // height: widget.MHeight * 0.1,
              margin: EdgeInsets.symmetric(horizontal: widget.MWidth * 0.02),
              child: Column(
                children: [
                  const Text(
                    "Luckily, we have a few cooling hacks you can use.",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    // height:DeviceSize.height(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ReadMoreText(
                        "Initializing Repository will create a .git folder inside the local repo, which will help you manage code using git file system. But, please note you have this code in your local, not on the cloud. So if your system crashes everything vanishes. But to deal with that situation you can publish the repo to GitHub. Everything will be the same as above but now you have the code on the cloud.",
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '..Read More',
                        style: TextStyle(fontSize: 13),
                        trimExpandedText: ' Less',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: widget.MHeight * 0.28,
              // color: Colors.amber,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 4.5 / 3,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  autoPlay: false,
                ),
                items: widget.imagesList
                    .map(
                      (item) => Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                            if (liked) {
                              like += 1;
                            } else {
                              like -= 1;
                            }
                          });
                        },
                        icon: liked
                            ? const Icon(
                                Icons.thumb_up,
                                color: Colors.pink,
                              )
                            : const Icon(Icons.thumb_up_outlined),
                        label: Text("$like Likes")),
                    TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        onPressed: () {},
                        icon: const Icon(Icons.comment),
                        label: const Text("2 Comments")),
                  ],
                ),
                TextButton.icon(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class firstColumn extends StatelessWidget {
  const firstColumn({
    Key? key,
    required this.MWidth,
  }) : super(key: key);

  final double MWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlutterLogo(
            size: MWidth * 0.1,
          ),
          SizedBox(
            width: MWidth * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AutoSizeText(
                "User name",
                style: TextStyle(fontWeight: FontWeight.bold),
                maxFontSize: 22,
                minFontSize: 18,
              ),
              AutoSizeText(
                "Time",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
