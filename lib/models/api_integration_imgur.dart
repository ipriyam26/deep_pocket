import 'package:http/http.dart' as http;

import 'imgurejson.dart';

class API_Manager {
  Future<String> postImage(String Image) async {
    var headers = {
      'Authorization': 'Bearer 5eeae49394cd929e299785c8805bd168fc675280'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.imgur.com/3/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', Image));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonString = await response.stream.bytesToString();
      print(jsonString);

      final imgur = imgurFromJson(jsonString);
      return imgur.data.link;
    } else {
      print(response.reasonPhrase);
      return "null";
    }

    // var client = http.Client();

    // var request = http.MultipartRequest(
    //     "POST", Uri.parse('https://api.imgur.com/3/upload'));

    // request.headers['Authorization'] = 'ClientId 0f7e3467f04a420';

    // // var picture = await http.MultipartFile.fromPath('image', Image);
    // var picture2 = await http.MultipartFile.fromBytes('image',
    //     (await rootBundle.load('assets/trial.png')).buffer.asUint8List());

    // request.files.add(picture2);
    // var response = await request.send();
    // var responseData = await response.stream.toBytes();
    // var result = String.fromCharCodes(responseData);

    // print(result);

    // print("tried");
    // // Welcome? result = null;
    // Map<String, String> requestHeaders = {
    //   'Authorization': 'Bearer 5eeae49394cd929e299785c8805bd168fc675280'
    // };
    // final response =
    //     await client.post(Uri.parse('https://api.imgur.com/3/upload'),
    //         // Send authorization headers to the backend.
    //         headers: requestHeaders,
    //         body: {'image': Image});

    // if (response.statusCode == 200) {
    //   // var jsonString = response.body;
    //   print(response.body);
    // var jsonMap = json.decode(response.body);
    // print(object)

    // print(response.body.length);

    // result = Welcome.fromJson(jsonMap);

    // print(result.response.content[0].title);

    // return result;
  }
  // return result;
}
