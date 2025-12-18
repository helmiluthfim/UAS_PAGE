import 'package:flutter/material.dart';
import 'package:uas_crud/model/pasien.dart';
import 'package:uas_crud/service/pasien_service.dart';
import 'package:uas_crud/ui/pasien/pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  Future<Pasien> getData() async {
    Pasien data = await PasienService().getById(widget.pasien.id.toString());
    setState(() {
      _namaPasienCtrl.text = data.nama_pasien;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField("No Rm", _noRmCtrl),
              _buildField("Nama Pasien", _namaPasienCtrl),
              _buildField("Tanggal Lahir", _tanggalLahirCtrl),
              _buildField("No Telpon", _noTelpCtrl),
              _buildField("Email", _alamatCtrl),
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
        Pasien pasien = new Pasien(
          nomor_rm: _noRmCtrl.text,
          nama_pasien: _namaPasienCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telpon: _noTelpCtrl.text,
          alamat: _alamatCtrl.text,
        );
        String id = widget.pasien.id.toString();
        await PasienService().ubah(pasien, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }

  @override
  void dispose() {
    _noRmCtrl.dispose();
    _namaPasienCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _noTelpCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }
}
