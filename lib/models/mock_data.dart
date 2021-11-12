import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data_feed.dart';

class mockData with ChangeNotifier {
  List<dataFeed> _data = [
    // dataFeed(
    //   id: DateTime.now().toString(),
    //   imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
    //   name: "Priyam Srivastava",
    //   title: "How to change room ?",
    //   tag: 1,
    //   text:
    //       "I would like to know the process of changing my room cause I have not been able to study, and my roomate always plays music and drinks too much then shouts all night, please tell me how",
    //   date: '',
    // ),
    // dataFeed(
    //   id: DateTime.now().toString(),
    //   imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
    //   title: "Anyone intresed in playing BGMI?",
    //   name: "Part Agarwal",
    //   tag: 2,
    //   text:
    //       "So I have been looing for a squad for a long time and now i have finally decided that I am gonna buckle up and ask you all to join me",
    //   date: '',
    // ),
    // dataFeed(
    //   id: DateTime.now().toString(),
    //   imgsrc: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
    //   title: "How to solve this question in O(n) complexity",
    //   name: "Preet Singh",
    //   tag: 3,
    //   text:
    //       "So I have been looing for a squad for a long time and now i have finally decided that I am gonna buckle up and ask you all to join me",
    //   date: '',
    // ),
  ];
  List<dataFeed> get items {
    return [..._data];
  }

  Future<void> fetchandAddPost() async {
    var url =
        Uri.parse('https://deep-d7e90-default-rtdb.firebaseio.com/feed.json');
    try {
      print("getting your data");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<dataFeed> loadedPosts = [];
      extractedData.forEach((key, value) {
        loadedPosts.add(dataFeed(
            id: key,
            imgsrc: value['imgsrc'],
            name: value['name'],
            title: value['title'],
            text: value['text'],
            date: value['date']));
      });

      _data = loadedPosts;
      notifyListeners();
    } catch (e) {
      print(e);
      // TODO
    }
  }

  Future<void> addPost(dataFeed newpost) async {
    var url =
        Uri.parse('https://deep-d7e90-default-rtdb.firebaseio.com/feed.json');
    try {
      final response = await http.post(
        url as Uri,
        body: json.encode({
          'imgsrc': newpost.imgsrc,
          'name': newpost.name,
          'title': newpost.title,
          'text': newpost.text,
          'tag': newpost.tag,
          'date': newpost.date,
        }),
      );

      final newPost = dataFeed(
          id: json.decode(response.body)['name'],
          imgsrc: newpost.imgsrc,
          name: newpost.name,
          title: newpost.title,
          text: newpost.text,
          tag: newpost.tag,
          date: newpost.date);
      _data.insert(0, newPost);
      notifyListeners();
    } catch (e) {
      print(e);
      // TODO
    }
  }
}
