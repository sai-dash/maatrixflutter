import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maatrixflutter/data/app_excaptions.dart';
import 'package:maatrixflutter/data/network/base_api_services.dart';
import 'package:dio/dio.dart';

import '../../model/util/utils.dart';


class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Uri uri = Uri.parse(url);
      debugPrint("URL: $uri");
      final response = await http.get(uri,
          headers: Utils.urlHeaders(requestBody: json.encode(uri.queryParameters)));
      responseJson = returnResponse(hResponse: response, isHttp: true);
    } on SocketException {
      Map<String, dynamic> response = {"code":0};
      responseJson = response;
      //throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,String data) async {
    dynamic responseJson;
    try {
      Uri link = Uri.parse(url);
      debugPrint("URL: $link");
      dynamic response = await http.post((link),
          headers: Utils.urlHeaders(requestBody: json.encode(data)),
          body: json.encode(data));
      responseJson = returnResponse(hResponse: response, isHttp: true);
      debugPrint(responseJson.toString());
    }  on SocketException {
      Map<String, dynamic> response = {"code":0};
      responseJson = response;
      //throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostFormDataResponse(String url, Map<String, dynamic> data) async{
    dynamic responseJson;
    try {
      debugPrint("URL: $url");
      FormData formData = FormData.fromMap(data);
      debugPrint('Form Data----------->$formData');
      Response response = await Dio().post(
        url,
        options: Options(
          method: "POST",
        ),
        data: formData,
      );
      responseJson = returnResponse(dioResponse: response, isHttp: false);
      //debugPrint(responseJson.toString());
    }  catch(e) {
      return {"code":0};
    }
    return responseJson;
  }

  dynamic returnResponse({http.Response? hResponse, Response? dioResponse, bool? isHttp}) {
    dynamic response = (isHttp!) ? hResponse : dioResponse;
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = (isHttp) ? jsonDecode(response.body) : response.data;
        return responseJson;
      case 500:
        return null;
      case 400:
        throw BadRequestException((isHttp) ? response.body.toString() : response.data.toString());
      case 404:
        throw UnauthorisedException((isHttp) ? response.body.toString() : response.data.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code${response.statusCode}');
    }
  }



}



// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:rvpn/data/app_excaptions.dart';
// import 'package:rvpn/data/network/base_api_services.dart';

// import '../../utils/utils.dart';

// class NetworkApiService extends BaseApiServices {
//   @override
//   Future getGetApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       Uri uri = Uri.parse(url);
//       debugPrint("URL: $uri");
//       final response = await http.get(uri,
//           headers:
//               Utils.urlHeaders(requestBody: json.encode(uri.queryParameters)));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       Map<String, dynamic> response = {"code":0};
//       responseJson = response;
//       //throw FetchDataException('No Internet Connection');
//     }

//     return responseJson;
//   }

//   @override
//   Future getPostApiResponse(String url, Map<String, dynamic> data) async {
//     dynamic responseJson;
//     try {
//       Uri link = Uri.parse(url);
//       debugPrint("URL: $link");
//       dynamic response = await http.post((link),
//           headers: Utils.urlHeaders(requestBody: json.encode(data)),
//           body: json.encode(data));
//       responseJson = returnResponse(response);
//       debugPrint(responseJson.toString());
//     }  on SocketException {
//       Map<String, dynamic> response = {"code":0};
//       responseJson = response;
//       //throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }

//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 500:
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       default:
//         throw FetchDataException(
//             'Error accured while communicating with serverwith status code${response.statusCode}');
//     }
//   }
// }
