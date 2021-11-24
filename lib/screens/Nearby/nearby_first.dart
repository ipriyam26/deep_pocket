import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deep_pocket_1/screens/Nearby/place.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class nearBy extends StatefulWidget {
  nearBy({Key? key}) : super(key: key);

  @override
  _nearByState createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  ScrollController _scrollController = ScrollController();

  List<String> Types = [
    // 'All',
    'Bank',
    'Food',
    'General Store',
    'Hangouts',
    'Library',
    'Medicine',
    'Library',
    'Salons',
    'Stationers',
  ];

  int _selected = -1;
  int currentMax = 10;
  Future<QuerySnapshot<Map<String, dynamic>>> getPlaces() async {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          currentMax = currentMax + 5;
        });
      }
    });

    if (_selected == -1) {
      return await FirebaseFirestore.instance
          .collection("Nearby")
          .limit(currentMax)
          .get();
    } else {
      return await FirebaseFirestore.instance
          .collection("Nearby")
          .where("Catagory", isEqualTo: Types[_selected])
          .limit(currentMax)
          .get();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
        title: Text(
          'NearBy'.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
      ),
      endDrawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "Filters",
              style: TextStyle(color: Colors.pink),
            ),
          ),
          backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
          body: SafeArea(
              child: Column(
            children: [
              for (int i = -1; i < Types.length; i++)
                ListTile(
                  leading: Radio(
                      // focusColor: Colors.white,
                      // overlayColor: MaterialStateProperty<Color>[],
                      value: i,
                      groupValue: _selected,
                      activeColor: Colors.pink,
                      onChanged: (int? value) {
                        setState(() {
                          _selected = value!;
                          Navigator.pop(context);
                        });
                      }),
                  title: i == -1
                      ? const Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          Types[i],
                          style: TextStyle(color: Colors.white),
                        ),
                )
            ],
          )),
        ),
      ),
      body: FutureBuilder(
          // stream: null,
          future: getPlaces(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              );
            }
            var data = snapshot.data!.docs;
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: data.length,
                  // shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) =>
                      nearbyCard(data: data[index])),
            );
          }),
    );
  }
}

class nearbyCard extends StatelessWidget {
  nearbyCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  Map<String, IconData> TypesImage =
      // 'All',
      {
    'Bank': Icons.account_balance,
    'Food': Icons.food_bank,
    'General Store': Icons.add_business,
    'Hangouts': Icons.catching_pokemon,
    'Library': Icons.library_books,
    'Medicine': Icons.medication,
    'Salons': Icons.content_cut,
    'Stationers': Icons.edit,
  };
  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.pink,
      onTap: () {
        Navigator.pushNamed(
          context,
          place.route,
          arguments: data,
        );
      },
      child: Card(
        color: const Color.fromRGBO(40, 41, 40, 1),
        child: ListTile(
          trailing: IconButton(
            splashColor: Colors.pink,
            icon: const Icon(
              Icons.directions_outlined,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () async {
              final url = data.data()['Url'];
              if (await canLaunch(url!)) {
                await launch(
                  url,
                  forceSafariVC: true,
                  forceWebView: true,
                  enableJavaScript: true,
                );
              }
            },
          ),
          leading: Icon(
            TypesImage[data.data()['Catagory']],
            color: Colors.pink,
            size: 42,
          ),
          subtitle: Text(
            data.data()['Address'],
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          title: Text(
            data.data()['Name'],
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
