import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String baseUrl = 'http://20.1.1.181:8000/api';

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login_mobile'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fcm_token': fcmToken,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {
        'token': data['token'],
        'user': data['user'],
      };
    } else {
      throw Exception(data['message'] ?? 'Login gagal');
    }
  }
}
