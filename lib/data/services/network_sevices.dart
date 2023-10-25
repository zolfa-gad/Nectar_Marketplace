import 'package:dio/dio.dart';

import '../constants/end_points.dart';

class AppNetworkServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future getData({
    Map<String, dynamic>? query,
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    Response response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    // debugPrint('data: ${response.data}');
    return response.data;
  }

  static Future postData({
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    Response response = await dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
    // debugPrint('ResData: ${response.data.toString()}');
    // debugPrint(response.data);
    return response.data;
  }

  static Future updateData({
    required Map<String, dynamic> data,
    required String endPoint,
    required String token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    Response response = await dio.put(
      endPoint,
      // queryParameters: query,
      data: data,
    );
    // debugPrint('ResData: ${response.data.toString()}');
    // debugPrint(response.data);
    return response.data;
  }

  // static Future<Response> getCategories({
  //   required String endPoint,
  // }) async {
  //   // dio.options.headers = {'Auth': ''};
  //   Response response = await dio.get(
  //     endPoint,
  //   );
  //   print('hjhhhhhhhhhhhh');
  //   print('data: ${response.data['status']}');
  //   // var data = response.data;
  //   return response;
  // }

  // static var url;
  // AppServices() {
  //   url = "https://www.postman.com/collections/94db931dc503afd508a5";
  //   //  url = Uri.https(
  //   // '/collections/94db931dc503afd508a5',
  //   // '/books/v1/volumes',
  //   // {
  //   // 'q': '{http}',
  //   // },
  //   // );
  //   // url = Uri.https(
  //   //   // 'https://www.postman.com/collections/94db931dc503afd508a5',
  //   //   // '/books/v1/volumes',
  //   //   // {
  //   //   //   'q': '{http}',
  //   //   // },
  //   // );
  //   // url = Uri(path: 'https://www.postman.com/collections/94db931dc503afd508a5');
  // }
  // Future TestHttp() async {
  //   // var URL = "https://jsonplaceholder.typicode.com/albums";
  //   var Response = await http.get(Uri.parse(URL));
  //   var Body = jsonDecode(Response.body);
  //   Album.addAll(Body);
  //   print('Body: $Album');
  // }

  // static init() {
  //   url = Uri.https(
  //     'www.googleapis.com',
  //     '/books/v1/volumes',
  //     {
  //       'q': '{http}',
  //     },
  //   );
  // }

  // static Future getUserData({
  //   required Map<String, dynamic> queryParameters,
  // }) async {
  //   final Uri url = Uri.https(
  //     baseURL,
  //     '/api/login',
  //     queryParameters,
  //   );

  //   try {
  //     var response = await http.get(url);
  //     // body: {'name': 'doodle', 'color': 'blue'});
  //     http.Response responseBody = jsonDecode(
  //       response.body,
  //     ).then((body) {
  //       print(body);
  //     });

  //     print('responseBody: $responseBody');
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  // static Future postUserData({
  //   required Map<String, dynamic> queryParameters,
  // }) async {
  //   final Uri url = Uri.https(
  //     baseURL,
  //     '/api/login',
  //     queryParameters,
  //   );

  //   try {
  //     var response = await http.post(url, headers: {
  //       'lang': 'en',
  //       'Content-Type': 'application/json',
  //     });
  //     // body: {'name': 'doodle', 'color': 'blue'});
  //     http.Response responseBody = jsonDecode(
  //       response.body,
  //     );

  //     print('responseBody: $responseBody');
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  // var client = http.Client();
  // try {
  //   var response = await client.post(
  //     Uri.https('example.com', 'whatsit/create'),
  //     body: {'name': 'doodle', 'color': 'blue'},
  //   );
  //   var decodedResponse = jsonDecode(
  //     utf8.decode(
  //       response.bodyBytes,
  //     ),
  //   ) as Map;
  //   var uri = Uri.parse(decodedResponse['uri'] as String);
  //   print(await client.get(uri));
  // } finally {
  //   client.close();
  // }

  // var client = http.Client();
  // try {
  //   var response = await client
  //       .get(Uri.https(baseURL, '/api/products', queryParameters));
  //   // body: {'name': 'doodle', 'color': 'blue'});
  //   var responseBody = jsonDecode(response.body) as Map;
  //   print('responseBody: $responseBody');
  //   // var uri = Uri.parse(decodedResponse['uri'] as String);
  //   // print(await client.get(uri));
  // } finally {
  //   client.close();
  // }

  // try {
  //   final Uri url = Uri.https(
  //     baseURL,
  //     '/api/products',
  //     queryParameters,
  //   );
  //   final client = HttpClient();
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   // final http =  IOClient(client);
  //   http.get(url).then((response) {
  //     print("Reponse status : ${response.statusCode}");
  //     print("Response body : ${response.body}");
  //   });
  // } catch (error) {
  //   print(error.toString());
  // }

  // http.Response response = await http.get(url);
  // // http.Response response = await http.get(Uri.parse(url));
  // if (response.statusCode == 200) {
  //   var jsonResponse = jsonDecode(response.body);
  //   // return jsonResponse;
  //   print(jsonResponse);

  //   // print(jsonResponse);
  //   // print(jsonResponse);
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }

  // final queryParameters = {
  //   'param1': 'one',
  //   'param2': 'two',
  // };

  // final responsee = await http.get(uri, headers: {
  //   // HttpHeaders.authorizationHeader: 'Token $token',
  //   // HttpHeaders.contentTypeHeader: 'application/json',
  // });

  // Future getData() async {
  //   // This example uses the Google Books API to search for books about http.
  //   // https://developers.google.com/books/docs/overview

  //   // Await the http get response, then decode the json-formatted response.
  //   http.Response response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     // as Map<String, dynamic>;
  //     // var itemCount = jsonResponse['totalItems'];
  //     // print('Number of books about http: $itemCount.');
  //     print(jsonResponse);
  //     print(jsonResponse);
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }

  //   // final queryParameters = {
  //   //   'param1': 'one',
  //   //   'param2': 'two',
  //   // };
  //   // final uri = Uri.https(
  //   //   'www.myurl.com',
  //   //   '/api/v1/test/',
  //   //   queryParameters,
  //   // );
  //   // final responsee = await http.get(uri, headers: {
  //   //   // HttpHeaders.authorizationHeader: 'Token $token',
  //   //   // HttpHeaders.contentTypeHeader: 'application/json',
  //   // });
  // }
}
