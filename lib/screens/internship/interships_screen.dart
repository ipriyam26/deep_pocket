import 'package:flutter/material.dart';

import 'package:deep_pocket_1/screens/internship/half_widgets.dart';

class internShips extends StatelessWidget {
  static const route = '/internships';

  var workfromhome = true;
  var salary = 6000;
  var title = "Title";
  var time = "Time";
  var companyName = "Company Name";
  var partTimeAllowed = true;
  var date = " Date";
  var imageSrc =
      "https://media.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Interships"),
        ),
        body: ListView(
          children: [
            internshipCard(
              title: title,
              companyName: companyName,
              imageSrc: imageSrc,
              workfromhome: workfromhome,
              salary: salary,
              time: time,
              partTimeAllowed: partTimeAllowed,
              date: date,
            ),
            internshipCard(
              title: title,
              companyName: companyName,
              imageSrc: imageSrc,
              workfromhome: workfromhome,
              salary: salary,
              time: time,
              partTimeAllowed: partTimeAllowed,
              date: date,
            ),
            internshipCard(
              title: title,
              companyName: companyName,
              imageSrc: imageSrc,
              workfromhome: workfromhome,
              salary: salary,
              time: time,
              partTimeAllowed: partTimeAllowed,
              date: date,
            )
          ],
        ));
  }
}
