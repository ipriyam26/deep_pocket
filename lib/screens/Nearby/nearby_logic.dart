import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NearbyLogic {
  Future<void> addToFav(String id) async {
    await FirebaseFirestore.instance.collection("Nearby").doc(id).update({
      'SavedBy': FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
    });
  }

  Future<void> removeFromFav(String id) async {
    await FirebaseFirestore.instance.collection("Nearby").doc(id).update({
      'SavedBy':
          FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
    });
  }
}
