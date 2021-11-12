class UserModel {
  String? uid;
  String? email;
  String? Name;
  String? Image;
  String? CollegeName;
  String? enrollmentNo;

  UserModel(
      {this.uid,
      this.email,
      this.Name,
      this.enrollmentNo,
      this.CollegeName,
      this.Image});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      Name: map['Name'],
      enrollmentNo: map['enrollmentNo'],
      CollegeName: map['CollegeName'],
      Image: map['Image'],
    );
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
    };
  }
}
