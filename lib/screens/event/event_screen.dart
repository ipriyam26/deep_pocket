import 'package:carousel_slider/carousel_slider.dart';
import 'package:deep_pocket_1/screens/event/mock_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class eventScreen extends StatelessWidget {
  // const eventScreen({Key? key}) : super(key: key);
  static const route = 'even_tabs/event_screen';

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    final details = ModalRoute.of(context)!.settings.arguments as event;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 18, 18, 1),
      appBar: AppBar(
          title: Text(
            details.title,
          ),
          backgroundColor: Color.fromRGBO(16, 15, 1, 1)),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                details.imgsrc,
                height: MSize.height * 0.7 * 0.6,
                width: MSize.width,
                fit: BoxFit.fill,
              ),
              Container(
                height: MSize.height * 0.7 * 0.6,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.6, 0.85, 1.0],
                  colors: [
                    Color.fromRGBO(27, 18, 18, 0.1),
                    Color.fromRGBO(27, 18, 18, 0.3),
                    Color.fromRGBO(27, 18, 18, 0.8),
                    Color.fromRGBO(27, 18, 18, 1),
                  ],
                )),
                child: Container(
                  color: Colors.black.withOpacity(0.15),
                  // color: Colors.yellow,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      left: MSize.height * 0.02, bottom: MSize.height * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.Name,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MSize.height * 0.01,
                      ),
                      Text(
                        details.title,
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: i == 0
                          ? dateHost(MSize: MSize, details: details)
                          : aboutEvent(MSize: MSize, details: details));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class aboutEvent extends StatelessWidget {
  const aboutEvent({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final event details;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(
        horizontal: MSize.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("ABOUT THE EVENT",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: MSize.height * 0.7 * 0.6 * 0.04,
          ),
          Text(details.description,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}

class dateHost extends StatelessWidget {
  const dateHost({
    Key? key,
    required this.MSize,
    required this.details,
  }) : super(key: key);

  final Size MSize;
  final event details;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(
          right: MSize.height * 0.02,
          left: MSize.height * 0.02,
          bottom: MSize.height * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(DateFormat('d MMM y').format(details.date),
                  style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              if (details.endDate != null)
                Text(" - " + DateFormat('d MMM y').format(details.endDate!),
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w300))
            ],
          ),
          SizedBox(height: MSize.height * 0.01),
          if (DateFormat('EEEE').format(details.date) == 'Saturday' ||
              DateFormat('EEEE').format(details.date) == 'Sunday')
            const SizedBox(
              width: double.maxFinite,
              child: Text('Weekend',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300)),
            )
          else
            Container(
              width: double.maxFinite,
              child: const Text('Weekday',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          SizedBox(height: MSize.height * 0.01),
          const Divider(
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text("HOST",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            // color: Colors.pink,
            height: MSize.height * 0.2,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: details.host.length,
                itemBuilder: (context, i) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: MSize.height * 0.055,
                        width: MSize.height * 0.055,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: NetworkImage(details.host[i].img),
                          ),
                        ),
                      ),
                      title: Text(details.host[i].Name,
                          style: const TextStyle(
                              // fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      subtitle: Text(details.host[i].designation,
                          style: const TextStyle(
                              // fontSize: 17,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300)),
                    )),
          ),
        ],
      ),
    );
  }
}
