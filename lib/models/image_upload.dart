// ignore_for_file: camel_case_types, avoid_print

import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dkz1xfpuh', 'ijnzkrc3', cache: false);

class cloudimage {
  Future<String> postImage(String imagePath) async {
    print("trying to post");
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(imagePath,
            resourceType: CloudinaryResourceType.Image),
      );
      print(response);

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(" Error : ${e.message}");
      print(e.request);
      return "no link";
    }
  }
}
