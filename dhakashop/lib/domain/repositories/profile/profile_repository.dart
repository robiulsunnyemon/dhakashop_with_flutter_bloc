import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/models/profile/profile_model.dart';


class ProfileRepository {
  final String apiUrl;

  ProfileRepository({required this.apiUrl});

  Future<Profile> fetchProfile() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Profile.fromJson(data);
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
