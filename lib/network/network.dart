import 'dart:convert';
import '../model/book_model.dart';
import '../response/my_response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const String apiToken =
      'mRsTioI82CyP2U90XY397Zy1JEpnPfVPbEKAq9liWi1nVm5RIw';
  static const String baseUrl = 'crudapi.co.uk';

  static Future<MyResponse> getAllBooks() async {
    Uri uri = Uri.https(baseUrl, '/api/v1/books');
    try {
      http.Response response = await http.get(uri, headers: {
        "Authorization": "Bearer $apiToken",
        "Content-Type": "application/json"
      });
      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
                  ?.map((e) => BookModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: "We have Error: $error");
    }
  }

  static Future<MyResponse> addBook(BookModel productModel) async {
    Uri uri = Uri.https(baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer $apiToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJson()]),
      );
      if (response.statusCode == 201) {
        return MyResponse(data: "Product added successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> deleteBook(String productUUID) async {
    Uri uri = Uri.https(baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer $apiToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"_uuid": productUUID}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateBook(BookModel productModel) async {
    Uri uri = Uri.https(baseUrl, "/api/v1/books");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer $apiToken",
          "Content-Type": "application/json",
        },
        body: jsonEncode([productModel.toJsonForUpdate()]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  


}
