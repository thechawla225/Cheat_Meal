import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http_parser/http_parser.dart';


  ImageSender(file) async {
    print("ImageSender Called");
  http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:5000/upload'));

  request.files.add(
    await http.MultipartFile.fromPath(
      'images',
      file.path,
      contentType: MediaType('application', 'jpg'),
    ),
  );

  http.StreamedResponse r = await request.send();
  print(r.statusCode);
  print("Image Sender Success");
  http.Response Response = await http.get(Uri.http('10.0.2.2:5000','/find'));
  print("Called request");
  print("returning request");
  return Response.body;
  }