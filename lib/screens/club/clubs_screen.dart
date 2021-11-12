import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/club/club_models.dart';
import 'club_widgets.dart';

class clubsScreen extends StatelessWidget {
  static const route = '/clubsScreen';
  const clubsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clubdeatils = clubstream().mockClub;
    final MSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // height: MSize.height,
        padding: EdgeInsets.symmetric(
            horizontal: MSize.width * 0.04, vertical: MSize.height * 0.04),
        color: const Color(0xffE0E0E0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: MSize.height * 0.02, top: MSize.height * 0.05),
              child: const Text(
                "College Clubs",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: MSize.height * 0.87,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: clubdeatils.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: MSize.height * 0.015,
                      crossAxisSpacing: MSize.width * 0.03,
                      crossAxisCount: 2,
                      childAspectRatio: 19 / 22.1),
                  itemBuilder: (context, i) =>
                      clubCard(MSize: MSize, clubdeatils: clubdeatils[i])),
            ),
          ],
        ),
      ),
    ));
  }
}
