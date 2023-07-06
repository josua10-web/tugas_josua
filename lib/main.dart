import 'package:flutter/material.dart';
import 'package:flutter_ubsi_terbaru/add-poli.dart';
import 'package:flutter_ubsi_terbaru/berdanda.dart';
import 'package:flutter_ubsi_terbaru/helpers/user_info.dart';
import 'package:flutter_ubsi_terbaru/login.dart';
import 'package:flutter_ubsi_terbaru/update-poli.dart';
import 'package:flutter_ubsi_terbaru/model.dart';
import 'package:flutter_ubsi_terbaru/widget/sidebar.dart';

import 'package:flutter_ubsi_terbaru/repository.dart';

import 'detail-poli.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => MyHomePage(title: 'adawd'),
        '/add-poli': (context) => AddPoli(),
        '/update-poli': (context) => UpdatelPoli(),
      },
      debugShowCheckedModeBanner: false,
      home: TOKEN == null ? Login() : MyHomePage(title: 'adawd'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Poli> listPoli = [];
  Repository repository = Repository();

  getData() async {
    listPoli = await repository.getData();
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
          title: Text('Data Poli'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed('/add-poli'),
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Card(
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () async {
                            AlertDialog alertDialog = AlertDialog(
                                content: const Text('Yakin hapus data'));

                            bool response =
                                await repository.deleteData(listPoli[index].id);
                            if (response) {
                              print('Hapus data berhasil');
                            } else {
                              print('Hapus data gagal');
                            }
                            getData();
                          },
                          icon: Icon(Icons.delete)),
                      title: Text(
                        listPoli[index].nama_poli,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PoliDetail(
                                  nama_poli: listPoli[index].nama_poli,
                                  arguments: [
                                    listPoli[index].id,
                                    listPoli[index].nama_poli,
                                  ])),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: listPoli.length));
  }
}
