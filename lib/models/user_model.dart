// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? uid;
  String? email;
  String? Name;
  String? Image;
  String? CollegeName;
  String? enrollmentNo;
  List<String>? searchItems;
  int? Points;

  UserModel({
    this.uid,
    this.email,
    this.Name,
    this.enrollmentNo,
    this.CollegeName,
    this.Image,
    this.searchItems,
    this.Points,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        Name: map['Name'],
        enrollmentNo: map['enrollmentNo'],
        CollegeName: map['CollegeName'],
        Image: map['Image'],
        Points: map['Points'],
        searchItems: map['searchItems'] as List<String>?);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'Name': Name,
      'enrollmentNo': enrollmentNo,
      'CollegeName': CollegeName,
      'Image': Image,
      'searchItems': searchItems,
      'Points': Points
    };
  }
}
