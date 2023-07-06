import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ubsi_terbaru/repository.dart';
import 'package:flutter_ubsi_terbaru/widget/sidebar.dart';

class AddPoli extends StatefulWidget {
  const AddPoli({super.key});

  @override
  State<AddPoli> createState() => _AddPoliState();
}

class _AddPoliState extends State<AddPoli> {
  Repository repository = Repository();
  final _nama_PoliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? "NULL"
        : ModalRoute.of(context)!.settings.arguments as String;

    if (args[1].isNotEmpty) {
      _nama_PoliController.text = args[1];
    }
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Tambah Data Poli'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _nama_PoliController,
              decoration: InputDecoration(hintText: 'nama_poli'),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response =
                      await repository.postData(_nama_PoliController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print("Data gagal ditambahkan");
                  }
                },
                child: Text('Simpan')),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.putData(
                      int.parse(args[0]), _nama_PoliController.text);

                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    print("Update gagal ditambahkan");
                  }
                },
                child: Text('Update')),
          ],
        ),
      ),
    );
  }
}
