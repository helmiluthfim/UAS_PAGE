import 'package:flutter/material.dart';
import 'package:uas_crud/model/pasien.dart';
import 'package:uas_crud/service/pasien_service.dart';
import 'package:uas_crud/ui/pasien/pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);

  @override
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();

  final _noRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField("No RM", _noRmCtrl),
              _buildField("Nama Pasien", _namaPasienCtrl),
              _buildField("Tanggal Lahir", _tanggalLahirCtrl),
              _buildField("No Telpon", _noTelpCtrl),
              _buildField("Alamat", _alamatCtrl),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) =>
            value == null || value.isEmpty ? "$label wajib diisi" : null,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Pasien poli = new Pasien(
          nomor_rm: _noRmCtrl.text,
          nama_pasien: _namaPasienCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telpon: _noTelpCtrl.text,
          alamat: _alamatCtrl.text,
        );
        await PasienService().simpan(poli).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: value),
            ),
          );
        });
      },
      child: const Text("Simpan"),
    );
  }
}
