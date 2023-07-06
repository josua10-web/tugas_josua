import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ubsi_terbaru/repository.dart';

class UpdatelPoli extends StatefulWidget {
  const UpdatelPoli({super.key});

  @override
  State<UpdatelPoli> createState() => _UpdatelPoliState();
}

class _UpdatelPoliState extends State<UpdatelPoli> {
  Repository repository = Repository();
  final _nama_PoliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;

    if (args[1].isNotEmpty) {
      _nama_PoliController.text = args[1];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data Poli'),
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
