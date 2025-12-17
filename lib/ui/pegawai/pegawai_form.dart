import 'package:flutter/material.dart';
import 'package:uas_crud/model/pegawai.dart';
import 'package:uas_crud/ui/pegawai/pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);

  @override
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();

  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirPegawaiCtrl = TextEditingController();
  final _noTelpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField("NIP", _nipPegawaiCtrl),
              _buildField("Nama Pegawai", _namaPegawaiCtrl),
              _buildField("Tanggal Lahir", _tanggalLahirPegawaiCtrl),
              _buildField("No Telpon", _noTelpPegawaiCtrl),
              _buildField("Email", _emailPegawaiCtrl),
              _buildField("Password", _passwordPegawaiCtrl, isPassword: true),
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

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Pegawai pegawai = Pegawai(
            nip: _nipPegawaiCtrl.text,
            nama: _namaPegawaiCtrl.text,
            tanggal_lahir: _tanggalLahirPegawaiCtrl.text,
            nomor_telpon: _noTelpPegawaiCtrl.text,
            email: _emailPegawaiCtrl.text,
            password: _passwordPegawaiCtrl.text,
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: pegawai),
            ),
          );
        }
      },
      child: const Text("Simpan"),
    );
  }
}
