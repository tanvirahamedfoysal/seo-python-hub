import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  static const _defaultBaseUrl =
      'https://seo-python-hub-437e0515.fastapicloud.dev';
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: _defaultBaseUrl,
  );

  final http.Client _client;

  Future<BackendStatus> fetchHealth() async {
    final response = await _client.get(Uri.parse('$baseUrl/health'));
    if (response.statusCode != 200) {
      throw Exception('Backend returned HTTP ${response.statusCode}');
    }
    final payload = jsonDecode(response.body) as Map<String, dynamic>;
    return BackendStatus.fromJson(payload);
  }
}

class BackendStatus {
  const BackendStatus({required this.status, required this.service});

  final String status;
  final String service;

  factory BackendStatus.fromJson(Map<String, dynamic> json) {
    return BackendStatus(
      status: json['status'] as String? ?? 'unknown',
      service: json['service'] as String? ?? 'backend',
    );
  }
}
