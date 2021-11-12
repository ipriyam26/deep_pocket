import 'package:auto_size_text/auto_size_text.dart';
// import 'package:deep_pocket/screens/event/mock_event.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_model.dart';
import 'package:deep_pocket_1/screens/noticeboard/notice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'notice_card.dart';

// import 'filter_widget.dart';

class noticeBoard extends StatefulWidget {
  const noticeBoard({Key? key}) : super(key: key);
  static const route = '/noticeboard';

  @override
  State<noticeBoard> createState() => _noticeBoardState();
}

class _noticeBoardState extends State<noticeBoard> {
  int fil = -1;
  int cata = 0;
  // var newNotice;
  DateTime? _selected;
  DateTime? _selectedBefore;
  bool _isSearching = false;
  String? search;

  int _value = -1;

  bool isAfterDay(DateTime? b, DateTime? a) {
    // DateTime a = DateTime.now();
    if (b == null || a == null) {
      return false;
    }

    if (a.year < b.year) {
      return true;
    }
    if (a.month < b.month) {
      return true;
    }
    if (a.day <= b.day) {
      return true;
    }

    return false;
  }

  void updateFilter(tx, context) {
    setState(() {
      fil = tx;
    });

    Navigator.of(context).pop();
  }

  Future<Null> _selectTime(BuildContext context) async {
    final DateTime? picked_s = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked_s != null) {
      setState(() {
        _selected = picked_s;
      });
      Navigator.maybePop(context);
    }
  }

  Future<Null> _selectBeforeTime(BuildContext context) async {
    final DateTime? picked_s = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked_s != null) {
      setState(() {
        _selectedBefore = picked_s;
      });
      Navigator.maybePop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var MSize = MediaQuery.of(context).size;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    var newNotice = mockN().mockNotic;
    if (_selected != null) {
      newNotice =
          newNotice.where((day) => isAfterDay(day.date, _selected)).toList();
    }
    if (_selectedBefore != null) {
      newNotice = newNotice
          .where((day) => isAfterDay(
                _selectedBefore,
                day.date,
              ))
          .toList();
    }
    if (fil != -1) {
      newNotice = newNotice.where((element) => element.depNo == fil).toList();
    }
    if (search != null) {
      newNotice = newNotice.where((element) {
        if (element.title.toLowerCase().contains(search!.toLowerCase())) {
          return true;
        } else if (element.content
            .toLowerCase()
            .contains(search!.toLowerCase())) {
          return true;
        } else if (element.sender
            .toLowerCase()
            .contains(search!.toLowerCase())) {
          return true;
        }
        return false;
      }).toList();
    }
    newNotice.sort((a, b) => a.date.compareTo(b.date));
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            title: const Text("Noticeboard"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _selected = null;
                      _selectedBefore = null;
                      _isSearching = !_isSearching;
                      if (search != null) {
                        search = null;
                      }
                    });
                  },
                  icon: Icon(Icons.search)),
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              )
            ],
            backgroundColor: const Color.fromRGBO(16, 15, 1, 1)),
        backgroundColor: Colors.black,
        endDrawer: Drawer(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
            title: const Text('FILTERS'),
          ),
          body: Container(
            color: Colors.black,
            child: Row(
              children: [
                Container(
                  height: MSize.height,
                  // color: Colors.amber,
                  width: MSize.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: MSize.height * 0.01),
                        child: const Text("Categories",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              cata = 0;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text('Date',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 17,
                                  )))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              cata = 1;
                            });
                          },
                          child: Container(
                              // padding: const EdgeInsets.symmetric(vertical: ),
                              child: const Text('Depatment',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 17,
                                  ))))
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xFF262626),
                  height: MSize.height * 0.8,
                  child: cata == 0
                      ? Container(
                          width: MSize.width * 0.47,
                          margin: EdgeInsets.symmetric(
                            vertical: MSize.height * 0.05,
                          ),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: MSize.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.black,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "After Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      child: _selected != null
                                          ? Text(
                                              DateFormat.yMd()
                                                  .format(_selected!),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  height: 1.5,
                                                  // backgroundColor: Colors.grey,
                                                  color: Colors.white),
                                            )
                                          : const Text(
                                              "Pick a date",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  // backgroundColor: Colors.grey,
                                                  color: Colors.white),
                                            ),
                                      onPressed: () async {
                                        _selectTime(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MSize.height * 0.01,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.black,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Before Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      child: _selectedBefore != null
                                          ? Text(
                                              DateFormat.yMd()
                                                  .format(_selectedBefore!),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  height: 1.5,
                                                  // backgroundColor: Colors.grey,
                                                  color: Colors.white),
                                            )
                                          : const Text(
                                              "Pick a date",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  // backgroundColor: Colors.grey,
                                                  color: Colors.white),
                                            ),
                                      onPressed: () async {
                                        _selectBeforeTime(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _selected = null;
                                      _selectedBefore = null;
                                    });
                                    // updateFilter(-1, context);
                                  },
                                  child: const Text('Reset'))
                            ],
                          ))
                      : Container(
                          // color: Colors.amber,
                          child: Container(
                            margin: EdgeInsets.only(top: MSize.height * 0.02),
                            // height: MSize.height * 0.7,
                            child: Column(
                              children: <Widget>[
                                for (int i = -1; i < Department.length; i++)
                                  Container(
                                    width: MSize.width * 0.47,
                                    child: Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: Colors.white),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: i == -1
                                            ? const Text(
                                                "All",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                // style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                                              )
                                            : Text(
                                                Department[i],
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                // style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                                              ),
                                        leading: Radio(
                                          value: i,
                                          groupValue: _value,
                                          activeColor: Colors.orange,
                                          onChanged: (int? value) {
                                            setState(() {
                                              _value = value!;
                                            });
                                            updateFilter(_value, context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _value = -1;
                                      });
                                      updateFilter(-1, context);
                                    },
                                    child: Text('Reset'))
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        )),
        body: _isSearching
            ? Container(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        prefixIcon:
                            Icon(Icons.search_outlined, color: Colors.black),
                        prefix: Text('Search: ',
                            style: TextStyle(color: Colors.black)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: MSize.height * 0.01,
                    ),
                    Container(
                      height: MSize.height * 0.8,
                      // color: Colors.amber,
                      child: ListView.builder(
                          itemCount: newNotice.length,
                          itemBuilder: (context, i) =>
                              noticeCard(newNotice: newNotice[i])),
                    )
                  ],
                ),
              )
            : Container(
                // color: Colors.amber,
                child: ListView.builder(
                    itemCount: newNotice.length,
                    itemBuilder: (context, i) =>
                        noticeCard(newNotice: newNotice[i])),
              ));
  }
}
