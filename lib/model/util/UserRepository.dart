import 'dart:convert';

import 'package:maatrixflutter/model/ResponseModel.dart';
import '../../data/network/base_api_services.dart';
import '../../data/network/network_api_service.dart';
import 'ApiService.dart';

class UserRepository {
  // ApiService apiService = ApiService();
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> viewProfileImage(String userId) async {
    try {
      var response = await _apiServices.getPostApiResponse("http://maatricks.co.in/api/dealer_payment.php",  userId);
      if (response != null) {
        return profileFromJson(json.encode(response));
      } else {
        return null;
      }
    } catch (e) {
      return null;

    }
  }
}