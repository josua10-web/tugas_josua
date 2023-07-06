import 'package:flutter/material.dart';
import 'package:flutter_ubsi_terbaru/repository.dart';
import 'package:flutter_ubsi_terbaru/update-poli.dart';
import 'model.dart';

class PoliDetail extends StatefulWidget {
  final String nama_poli;
  const PoliDetail(
      {super.key, required this.nama_poli, required List<String> arguments});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  List<Poli> listPoli = [];
  Repository repository = Repository();
  final _nama_PoliController = TextEditingController();

  get index => listPoli;

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
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? "NULL"
        : ModalRoute.of(context)!.settings.arguments as String;

    if (args[1].isNotEmpty) {
      _nama_PoliController.text = args[1];
    }
    return Scaffold(
      appBar: AppBar(title: Text("Detail Poli")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.nama_poli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context)
                          .popAndPushNamed('/update-poli', arguments: [
                        listPoli[1].id,
                        listPoli[1].nama_poli,
                      ]),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Ubah")),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hapus")),
            ],
          )
        ],
      ),
    );
  }
}
