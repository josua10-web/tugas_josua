import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text("Doter Richard"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Dokter Alex "),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Dokter Mamah"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    );
  }
}
