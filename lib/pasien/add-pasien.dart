import 'package:flutter/material.dart';
import 'package:flutter_ubsi_terbaru/pasien/main.dart';
import 'package:flutter_ubsi_terbaru/pasien/repository.dart';

class AddPasien extends StatefulWidget {
  const AddPasien({super.key});

  @override
  State<AddPasien> createState() => _AddPasienState();
}

class _AddPasienState extends State<AddPasien> {
  Repository repository = Repository();
  final _nama_PasienController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Pasien'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _nama_PasienController,
              decoration: InputDecoration(hintText: 'nama_pasien'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'content'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool response = await repository.postData(
                    _nama_PasienController.text, _contentController.text);

                if (response) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PasienPage()));
                } else {
                  print("data Gagal ditambahkan");
                }
              },
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
