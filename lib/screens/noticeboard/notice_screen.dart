import 'package:auto_size_text/auto_size_text.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class noticeScreen extends StatelessWidget {
  // const noticeScreen({Key? key}) : super(key: key);
  static const route = '/noticeboard-home/notice-screen';

  @override
  Widget build(BuildContext context) {
    final MSize = MediaQuery.of(context).size;
    final newNotice = ModalRoute.of(context)!.settings.arguments as notice;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Department[newNotice.depNo],
        ),
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
      ),
      backgroundColor: Color(0xFF16161d),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MSize.width * 0.05, vertical: MSize.height * 0.025),
            width: double.maxFinite,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  newNotice.title,
                  style: const TextStyle(
                      fontSize: 23,
                      // color: Colors.white,
                      color: Colors.orange,
                      fontWeight: FontWeight.w800),
                  minFontSize: 16,
                  maxLines: 4,
                ),
                SizedBox(
                  height: MSize.height * 0.015,
                ),
                Text(
                  DateFormat('hh:mm a  dd MMM, y ').format(newNotice.date),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: MSize.height * 0.01,
                ),
                Text(
                  newNotice.sender,
                  // .format(newNotice.date),
                  style: const TextStyle(
                      color: Color(0xFFFF6700),
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            // child: ,
          ),
          Container(
            padding: EdgeInsets.only(
                right: MSize.width * 0.04,
                left: MSize.width * 0.04,
                top: MSize.height * 0.04),
            child: Text(newNotice.content,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
