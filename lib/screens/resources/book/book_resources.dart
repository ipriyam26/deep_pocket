// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
// import 'package:deep_pocket/screens/freecourse/api_integration.dart';
import 'package:deep_pocket_1/screens/freecourse/model_freecourse.dart';
import 'package:deep_pocket_1/screens/resources/book/book_model.dart';
import 'package:deep_pocket_1/screens/resources/book/book_viewer.dart';
import 'package:flutter/material.dart';

class bookResources extends StatefulWidget {
  const bookResources({Key? key}) : super(key: key);

  // const bookResources({Key? key}) : super(key: key);
  @override
  State<bookResources> createState() => _bookResourcesState();
}

class _bookResourcesState extends State<bookResources> {
  Response? result;
  String selected = 'Name';
  String? search;

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    var MHeight = MediaQuery.of(context).size.height;
    var MWidth = MediaQuery.of(context).size.width;
    var booklist = mockBooks().mockBook;
    if (_isSearching && search != null) {
      if (selected == 'Name') {
        booklist = booklist
            .where((element) =>
                element.Name.toLowerCase().contains(search!.toLowerCase()))
            .toList();
      } else if (selected == 'Subject') {
        booklist = booklist
            .where((element) =>
                element.topic.toLowerCase().contains(search!.toLowerCase()))
            .toList();
      } else {
        booklist = booklist
            .where((element) =>
                element.Author.toLowerCase().contains(search!.toLowerCase()))
            .toList();
      }
    }
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Book',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      // _selected = null;
                      // _selectedBefore = null;
                      _isSearching = !_isSearching;
                      if (search != null) {
                        search = null;
                      }
                    });
                  },
                  icon: const Icon(Icons.search))
            ],
            backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
        backgroundColor: const Color(0xFFFFF0E2),
        body: _isSearching
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: DropdownButton<String>(
                          style: const TextStyle(fontSize: 17, color: Colors.black),
                          dropdownColor: Colors.white,
                          // focusColor: Colors.white,
                          elevation: 0,
                          value: selected,
                          items: <String>['Name', 'Subject', 'Author']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selected = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: MWidth * 0.7,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            // focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.search_outlined,
                                color: Colors.black),

                            filled: true,
                            fillColor: Colors.white,

                            // hintText: 'Search: '
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              search = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: MHeight * 0.01,
                  // ),
                  // SizedBox(
                  //   height: MHeight * 0.01,
                  // ),
                  SizedBox(
                    // margin: EdgeInsets.only(top: MHeight * 0.01),
                    height: MHeight * 0.7,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: MHeight * 0.01),
                        itemCount: booklist.length,
                        itemBuilder: (context, i) => bookCard(
                            MWidth: MWidth,
                            MHeight: MHeight,
                            booklist: booklist[i])),
                  )
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    // margin: EdgeInsets.only(top: MHeight * 0.01),
                    height: MHeight * 0.76,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: MHeight * 0.01),
                        itemCount: booklist.length,
                        itemBuilder: (context, i) => bookCard(
                            MWidth: MWidth,
                            MHeight: MHeight,
                            booklist: booklist[i])),
                  )
                ],
              ));
  }
}

class bookCard extends StatelessWidget {
  const bookCard({
    Key? key,
    required this.MWidth,
    required this.MHeight,
    required this.booklist,
  }) : super(key: key);

  final double MWidth;
  final double MHeight;
  final Book booklist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        Navigator.pushNamed(context, bookViewer.route,
            arguments: booklist.link);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MWidth * 0.02, vertical: MHeight * 0.006),
        child: Card(
          // color: Colors.amber,
          color: const Color(0xffadd8e6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(MHeight * 0.015),
            // color: Colors.blue,
            // margin: EdgeInsets.symmetric(
            //     horizontal: MWidth * 0.1, vertical: MHeight * 0.01),
            height: MHeight * 0.2,
            width: MWidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    booklist.CoverImage,
                    height: MHeight * 0.2 * 0.85,
                    width: MWidth * 0.9 * 0.32,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: MWidth * 0.03,
                ),
                SizedBox(
                  width: MWidth * 0.9 * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text(booklist[i].topic),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(
                              booklist.topic,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          const Icon(Icons.arrow_right_outlined)
                        ],
                      ),
                      AutoSizeText(
                        booklist.Name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        minFontSize: 14,
                        // maxFontSize: 23,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: MHeight * 0.02,
                      ),
                      Text('Author: ${booklist.Author}')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
