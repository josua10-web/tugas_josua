import 'dart:convert';

import 'package:flutter_ubsi_terbaru/pasien/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://64867ad7beba6297278ed07e.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/pasien'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Pasien> pasien = it.map((e) => Pasien.fromJson(e)).toList();
        return pasien;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String nama_pasien, String content) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/pasien'),
          body: {"nama_pasien": nama_pasien, "content": content});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + '/pasien/' + id));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
