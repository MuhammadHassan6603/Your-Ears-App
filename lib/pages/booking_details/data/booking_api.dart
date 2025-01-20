import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendBookingData(
    Map<String, dynamic> bookingData, String token) async {
  final url = Uri.parse('https://portal.yourears.co.uk/api/orders/book');

  try {
    log('INSIDE TRYYYYY OF APIIII');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(bookingData),
    );
    log('RESPONSE IS DONEEEEE');
    //IS CONDITION ME NAI JARHA SEEDHA ELSE ME JARHA
    if (response.statusCode == 200) {
      log('INSIDE THE IF CONDITION');
      log('Booking Data: ${jsonEncode(bookingData)}');
      final responseData = jsonDecode(response.body);
      log('Booking successful: ${responseData['message']}');
    } else {
      log('IGNORED THE IF CONDITIONNN');
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');
      // log('Response Headers: ${response.headers}');
    }
  } catch (error) {
    log('Error: $error');
  }
}
