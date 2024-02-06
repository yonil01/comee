

import 'package:http/http.dart' as http;
import 'dart:convert';

String url = "http://127.0.0.1:6032/api/v1/reniec";

Future<Map<String, dynamic>?> GetDataReniec(Map<String, dynamic> formData) async {
  try {
    final response = await http.post(
      Uri.parse(url + "/dni"), // Replace with your API endpoint
      body: formData,
    );

    if (response.statusCode == 200) {
      // Data sent successfully
      print('Data sent successfully');

      // Decode the JSON response
      Map<String, dynamic> responseData = json.decode(response.body);

      // Return the response data
      return responseData['data'];
    } else {
      // Request failed
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    print('Error sending data: $error');
  }

  // Return null if an error occurs
  return null;
}