import 'package:deep_pocket_1/screens/club/club_detail_screen.dart';
import 'package:deep_pocket_1/screens/club/club_utils.dart';
import 'package:flutter/material.dart';

import 'club_models.dart';

class hostclub extends StatelessWidget {
  const hostclub({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final club details;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
          right: MSize.width * 0.02,
          left: MSize.width * 0.02,
          bottom: MSize.height * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.symmetric(
              horizontal: MSize.height * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("ABOUT THE CLUB",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    // const Divider(
                    //   color: Colors.white,
                    // ),
                    SizedBox(
                      height: MSize.height * 0.7 * 0.6 * 0.04,
                    ),
                    Text(details.descrption,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color(0xff696969),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: MSize.height * 0.7 * 0.6 * 0.04,
                ),
              ],
            ),
          ),
          SizedBox(height: MSize.height * 0.01),
          const Divider(
            color: Colors.black,
          ),
          ElevatedButton(
              onPressed: () => clubUtils.openEmail(
                  toEmail: details.social,
                  subject: 'Request to join the club',
                  body: " "),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.3),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: MSize.width * 0.1)),
              child: const Text("Join"))
        ],
      ),
    );
  }
}

class hostDetails extends StatelessWidget {
  const hostDetails({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final club details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MSize.width * 0.05, vertical: 4.0),
          child: const Text("HOST",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: MSize.width * 0.05),
          // color: Colors.pink,
          height: MSize.height * 0.09 * details.leaders.length,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: details.leaders.length,
              itemBuilder: (context, i) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: MSize.height * 0.055,
                      width: MSize.height * 0.055,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(details.leaders[i].img),
                        ),
                      ),
                    ),
                    title: Text(details.leaders[i].Name,
                        style: const TextStyle(
                            // fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    subtitle: Text(details.leaders[i].designation,
                        style: const TextStyle(
                            // fontSize: 17,
                            color: Color(0xff696969),
                            fontWeight: FontWeight.w300)),
                  )),
        ),
      ],
    );
  }
}

class clubCard extends StatelessWidget {
  const clubCard({
    Key? key,
    required this.MSize,
    required this.clubdeatils,
  }) : super(key: key);

  final Size MSize;
  final club clubdeatils;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, clubDetail.route, arguments: clubdeatils);
      },
      splashColor: Colors.white,
      child: Card(
        elevation: 5,
        // margin: EdgeInsets.all(10),
        color: Color.fromRGBO(40, 40, 43, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          margin: EdgeInsets.all(MSize.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: clubdeatils.img,
                child: Container(
                  height: MSize.height * 0.08,
                  width: MSize.height * 0.08,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(7),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(clubdeatils.img),
                          fit: BoxFit.cover)),
                ),
              ),
              Text(
                clubdeatils.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                clubdeatils.theme.toUpperCase(),
                style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
              Text(
                clubdeatils.membersNo.toString() + " members",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class details2 extends StatelessWidget {
  const details2({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final club details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.15),
      width: double.maxFinite,
      padding: EdgeInsets.only(
          left: MSize.height * 0.02, bottom: MSize.height * 0.025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            details.theme.toUpperCase(),
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: MSize.height * 0.01,
          ),
          Text(
            details.name,
            style: const TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class stackDetail extends StatelessWidget {
  const stackDetail({
    Key? key,
    required this.details,
    required this.MSize,
  }) : super(key: key);

  final club details;
  final Size MSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: details.img,
          child: Container(
            child: Image.network(
              details.img,
              height: MSize.height * 0.7 * 0.6,
              width: MSize.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: MSize.height * 0.7 * 0.6,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.6, 0.85, 1.0],
            colors: [
              Color.fromRGBO(28, 28, 28, 0.1),
              Color.fromRGBO(28, 28, 28, 0.3),
              Color.fromRGBO(28, 28, 28, 0.8),
              Color.fromRGBO(28, 28, 28, 1),
            ],
          )),
          child: details2(MSize: MSize, details: details),
        ),
      ],
    );
  }
}
