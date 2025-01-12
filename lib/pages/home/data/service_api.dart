import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_ears_app/models/services_model.dart';

class ServiceApiService {
  final String _baseUrl = "https://portal.yourears.co.uk/api/categories";

  Future<List<ServicesModel>> fetchServices(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ServicesModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}
