import 'package:http/http.dart' as http;
import 'dart:convert';

class SchoolInfo {
  final int id;
  final String name;
  final String domain;

  SchoolInfo({required this.id, required this.name, required this.domain});

  factory SchoolInfo.fromJson(Map<String, dynamic> json) {
    return SchoolInfo(
      id: json['schoolId'],
      name: json['schoolName'],
      domain: json['schoolDomain'],
    );
  }
}

Future<List<SchoolInfo>> fetchSchoolInfo() async {
  var url = 'http://localhost:8080/api/v1/school/getAll';
  final response = await http.get(Uri.parse(url));
  final responseBody = utf8.decode(response.bodyBytes);

  List list = jsonDecode(responseBody);
  var schoolList = list.map((element) => SchoolInfo.fromJson(element)).toList();
  return schoolList;
}