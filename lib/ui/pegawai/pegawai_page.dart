import 'package:flutter/material.dart';
import 'package:uas_crud/model/pegawai.dart';
import 'package:uas_crud/ui/pegawai/pegawai_form.dart';
import 'package:uas_crud/ui/pegawai/pegawai_item.dart';
import 'package:uas_crud/widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PegawaiForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
            pegawai: Pegawai(
              nip: "001",
              nama: "Jajang",
              tanggal_lahir: "02-09-2001",
              nomor_telpon: "012019231041",
              email: "yyy@gmail.com",
              password: "123",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              nip: "002",
              nama: "Bahlil",
              tanggal_lahir: "undifined",
              nomor_telpon: "9981312443",
              email: "bahlilotakkera@gmail.com",
              password: "1234",
            ),
          ),
        ],
      ),
    );
  }
}
