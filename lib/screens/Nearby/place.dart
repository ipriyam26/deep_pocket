import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nearby_logic.dart';

class place extends StatefulWidget {
  static const route = 'nearbyTab/nearby_first/place';

  @override
  State<place> createState() => _placeState();
}

class _placeState extends State<place> {
  @override
  Widget build(BuildContext context) {
    final places = ModalRoute.of(context)!.settings.arguments
        as QueryDocumentSnapshot<Map<String, dynamic>>;
    final Mheight = MediaQuery.of(context).size.height;
    final Mwidth = MediaQuery.of(context).size.width;

    Stream<DocumentSnapshot<Map<String, dynamic>>> getPlace() {
      return FirebaseFirestore.instance
          .collection("Nearby")
          .doc(places.id)
          .snapshots();
    }

    Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
      return await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
    }

    Future<QuerySnapshot<Map<String, dynamic>>> getPlaceReviews() async {
      return await FirebaseFirestore.instance
          .collection("Nearby Reviews")
          .where('PlaceID', isEqualTo: places.id)
          .get();
    }

    return StreamBuilder(
        stream: getPlace(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          }
          var place = snapshot.data!;
          List<dynamic> SavedBy =
              place.data()!['SavedBy'] ?? [] as List<dynamic>;
          List<dynamic> ReviewedBy =
              place.data()!['ReviewedBy'] ?? [] as List<dynamic>;
          bool Saved = SavedBy.contains(FirebaseAuth.instance.currentUser!.uid);
          bool Reviewed =
              ReviewedBy.contains(FirebaseAuth.instance.currentUser!.uid);
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                actions: [
                  if (!Reviewed)
                    IconButton(
                        onPressed: () async {
                          await inputDialoge(
                              context, place, Mwidth, Mheight, getUser);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  IconButton(
                      onPressed: () async {
                        Saved
                            ? await NearbyLogic().removeFromFav(place.id)
                            : await NearbyLogic().addToFav(place.id);
                      },
                      icon: Saved
                          ? const Icon(
                              Icons.bookmark,
                              color: Colors.pink,
                            )
                          : const Icon(
                              Icons.bookmark_border,
                              color: Colors.pink,
                            ))
                ],
                backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
                title: Text(
                  place.data()!['Catagory'],
                  style: const TextStyle(color: Colors.pink),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: Mheight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            place.data()!['Name'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            maxFontSize: 30,
                            minFontSize: 24,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: place.data()!['Rating'] * 1.0,
                                      unratedColor: Colors.grey,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                      ),
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      direction: Axis.horizontal,
                                    ),
                                    Text(
                                        "(" +
                                            place
                                                .data()!['ReviewNo']
                                                .toString() +
                                            ")",
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                    ),
                                    Text(" : ${SavedBy.length}",
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.pink,
                              onTap: () async {
                                final url = place.data()!['Url'];
                                if (await canLaunch(url!)) {
                                  await launch(
                                    url,
                                    forceSafariVC: true,
                                    forceWebView: true,
                                    enableJavaScript: true,
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.pink)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Container(
                                  width: Mwidth * 0.34,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.directions_outlined,
                                        size: 22,
                                        color: Colors.pink,
                                      ),
                                      SizedBox(width: Mwidth * 0.03),
                                      const Text(
                                        "Directions",
                                        style: TextStyle(
                                            color: Colors.pink, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: Mheight * 0.01),
                          padding: EdgeInsets.symmetric(
                              vertical: Mheight * 0.01,
                              horizontal: Mwidth * 0.01),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(place.data()!['Address'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Mheight * 0.01,
                        ),
                        reviewss(getPlaceReviews, Mwidth),
                      ]),
                ),
              ));
        });
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> reviewss(
      Future<QuerySnapshot<Map<String, dynamic>>> getPlaceReviews(),
      double Mwidth) {
    return FutureBuilder(
        future: getPlaceReviews(),
        builder:
            (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final reviews = snap.data!.docs;
          print(reviews.length);
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: Mwidth * 0.01),
              child: ListTile(
                // minLeadingWidth: Mwidth * 0.17,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: Colors.white.withOpacity(0.1),
                leading: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: reviews[index].data()['AuthorImage'],
                    fit: BoxFit.cover,
                    height: Mwidth * 0.17,
                    width: Mwidth * 0.17,
                    placeholder: (context, _) {
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      reviews[index]
                          .data()['AuthorName']
                          .toString()
                          .split(" ")[0],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: Mwidth * 0.05,
                    ),
                    RatingBarIndicator(
                      rating: reviews[index].data()['Rating'] * 1.0,
                      unratedColor: Colors.grey,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.pink,
                      ),
                      itemCount: 5,
                      itemSize: 17.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
                subtitle: Text(
                  reviews[index].data()['Review'].toString(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          );
        });
  }

  inputDialoge(
      BuildContext context,
      DocumentSnapshot<Map<String, dynamic>> place,
      double Mwidth,
      double Mheight,
      Future<DocumentSnapshot<Map<String, dynamic>>> getUser()) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          final Userreview = TextEditingController();
          double Userrating = 0;
          int ratingNo = place.data()!['ReviewNo'] ?? 0;
          double Rating = place.data()!['Rating'] * 1.0;
          double TRating = ratingNo * Rating;
          final uid = FirebaseAuth.instance.currentUser!.uid;
          return Dialog(
            backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
            insetPadding: EdgeInsets.symmetric(horizontal: Mwidth * 0.01),
            child: Container(
              width: Mwidth * 0.9,
              height: Mheight * 0.35,
              padding: EdgeInsets.symmetric(
                  horizontal: Mwidth * 0.04, vertical: Mheight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add Your Review",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: Mheight * 0.01,
                  ),
                  RatingBar.builder(
                    itemSize: 27,
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: Colors.white.withOpacity(0.1),
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      Userrating = rating;
                    },
                  ),
                  SizedBox(
                    height: Mheight * 0.01,
                  ),
                  Container(
                    height: Mheight * 0.18,
                    child: TextField(
                      controller: Userreview,
                      expands: true,
                      autocorrect: false,
                      maxLines: null,
                      minLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  FutureBuilder(
                      future: getUser(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  if (Userreview.text.isNotEmpty) {
                                    await FirebaseFirestore.instance
                                        .collection("Nearby Reviews")
                                        .add({
                                      'AuthorImage':
                                          snapshot.data!.data()!['Image'],
                                      'AuthorName':
                                          snapshot.data!.data()!['Name'],
                                      'AuthorID': uid,
                                      'PlaceID': place.id,
                                      'Rating': Userrating,
                                      'Review': Userreview.text,
                                    });
                                    await FirebaseFirestore.instance
                                        .collection("Nearby")
                                        .doc(place.id)
                                        .update({
                                      'ReviewedBy':
                                          FieldValue.arrayUnion([uid]),
                                      'ReviewNo': ratingNo + 1,
                                      'Rating': (TRating + Userrating) /
                                          (ratingNo + 1)
                                    });
                                    Fluttertoast.showToast(msg: "Posted");
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  "Post",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.pink),
                                )),
                          ],
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
