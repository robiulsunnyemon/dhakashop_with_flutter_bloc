import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiService {
  final String baseUrl = 'http://192.168.0.108:8000/api/';
  String token="d3ee5ff6ff740b97cc90e11c7e408d881b3e8ad3";

  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await http.get(
          Uri.parse('$baseUrl$endpoint'),
        headers: {
            'Content-Type': 'application/json',
            'token':token
        }
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }

  Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      throw Exception('Failed to delete data');
    }
  }
}

