

abstract class BaseApiServices {

  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url , String data);

  Future<dynamic> getPostFormDataResponse(String url , Map<String, dynamic> data);

}