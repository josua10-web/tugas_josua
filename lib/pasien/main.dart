import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_ubsi_terbaru/pasien/add-pasien.dart';
import 'package:flutter_ubsi_terbaru/pasien/model.dart';
import 'package:flutter_ubsi_terbaru/pasien/repository.dart';
import 'package:flutter_ubsi_terbaru/widget/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> listPasien = [];
  Repository repository = Repository();

  getData() async {
    listPasien = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Detail Pasien'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPasien()));
              })
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                child: Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            Text(
                              listPasien[index].nama_pasien,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(listPasien[index].content),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            AlertDialog alertDialog = AlertDialog(
                                content: const Text('Yakin hapus data'));

                            bool response = await repository
                                .deleteData(listPasien[index].id);
                            if (response) {
                              print('Hapus data berhasil');
                            } else {
                              print('Hapus data gagal');
                            }
                            getData();
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listPasien.length),
    );
  }
}
