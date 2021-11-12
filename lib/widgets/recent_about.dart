import 'package:flutter/material.dart';

class RecentAbout extends StatefulWidget {
  const RecentAbout({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentAbout> createState() => _RecentAboutState();
}

class _RecentAboutState extends State<RecentAbout> {
  bool recent = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.04,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        recent = true;
                      });
                    },
                    child: const Text(
                      "Recent",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        recent = false;
                      });
                    },
                    child: const Text(
                      "About",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
              ],
            )),
        recent
            ? Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'assets/addpost.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      'Add Post To See',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'assets/event.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      'Add About You',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
      ],
    ));
  }
}
