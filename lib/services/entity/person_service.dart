

import 'package:http/http.dart' as http;

String url = "http://127.0.0.1:6032/api/v1/info-basic-persons";

Future<void> CreateBasicInformationPerson(Map<String, dynamic> formData) async {
  try {
    final response = await http.post(
      Uri.parse(url + "create"), // Replace with your API endpoint
      body: formData,
    );

    if (response.statusCode == 200) {
      // Data sent successfully
      print('Data sent successfully');
    } else {
      // Request failed
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    print('Error sending data: $error');
  }
}


