import 'dart:convert';
import 'package:cherrystreet/features/advisor/data/models/advisor_model.dart';
import 'package:http/http.dart' as http;

class AdvisorRemoteDataSource {
  final String baseUrl;

  AdvisorRemoteDataSource(this.baseUrl);

  Future<AdvisorModel> fetchAdvisor() async {
    final response = await http.get(Uri.parse('$baseUrl/advisor/advisor'));

    if (response.statusCode == 200) {
      return AdvisorModel.fromJson(json.decode(response.body)['advisor']);
    } else {
      throw Exception('Failed to load advisor');
    }
  }
}
