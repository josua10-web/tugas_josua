import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ubsi_terbaru/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://64867ad7beba6297278ed07e.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/poli'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Poli> poli = it.map((e) => Poli.fromJson(e)).toList();
        return poli;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String nama_poli) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/poli'), body: {
        "nama_poli": nama_poli,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int id, String nama_poli) async {
    try {
      final response =
          await http.put(Uri.parse(_baseUrl + '/poli/' + id.toString()), body: {
        'nama_poli': nama_poli,
      });
      if (response.statusCode == 200) {
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
      final response = await http.delete(Uri.parse(_baseUrl + '/poli/' + id));
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
