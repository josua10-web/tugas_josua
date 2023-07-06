import 'package:flutter/material.dart';
import 'package:flutter_ubsi_terbaru/berdanda.dart';
import 'package:flutter_ubsi_terbaru/login.dart';
import 'package:flutter_ubsi_terbaru/main.dart';
import 'package:flutter_ubsi_terbaru/model.dart';
import 'package:flutter_ubsi_terbaru/pasien/main.dart';
import 'package:flutter_ubsi_terbaru/pegawai/main.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@admin.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text('Poli'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Pasien'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_rounded),
            title: Text('Pegawai'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Keluar'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
