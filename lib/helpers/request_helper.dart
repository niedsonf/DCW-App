import 'package:getmage/controllers/menu_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*class Response {
  List<dynamic>? responseListType;
  Map<dynamic, dynamic>? responseMapType;
  String url;
  Response({this.responseListType, this.responseMapType, required this.url});
}*/

requestImage(String api) async {
  Uri url;
  http.Response response;

  switch (api) {
    case CatMenuItem:
      url = Uri.parse('https://api.thecatapi.com/v1/images/search');
      response = await http.get(url);
      List<dynamic> responseObject = json.decode(response.body);
      return responseObject[0]['url'];
    //return Response(responseListType: responseObject, url: responseObject[0]['url']);

    case DogMenuItem:
      url = Uri.parse('https://dog.ceo/api/breeds/image/random');
      response = await http.get(url);
      Map<dynamic, dynamic> responseObject = json.decode(response.body);
      return responseObject['message'];
    //return Response(responseMapType: responseObject,url: responseObject['message'],);

    case WaifuMenuItem:
      url = Uri.parse('https://api.waifu.im/random');
      response = await http.get(url);
      Map<dynamic, dynamic> responseObject = json.decode(response.body);
      return responseObject['images'][0]['url'];
    //return Response(responseMapType: responseObject,url: responseObject['images'][0]['url']);

    default:
      return null;
  }
}
