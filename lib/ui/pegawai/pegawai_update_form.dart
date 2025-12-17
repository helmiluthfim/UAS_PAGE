import 'package:flutter/material.dart';
import 'package:uas_crud/model/pegawai.dart';
import 'package:uas_crud/ui/pegawai/pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();

  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggalLahirPegawaiCtrl = TextEditingController();
  final _noTelponPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nipPegawaiCtrl.text = widget.pegawai.nip;
    _namaPegawaiCtrl.text = widget.pegawai.nama;
    _tanggalLahirPegawaiCtrl.text = widget.pegawai.tanggal_lahir;
    _noTelponPegawaiCtrl.text = widget.pegawai.nomor_telpon;
    _emailPegawaiCtrl.text = widget.pegawai.email;
    _passwordPegawaiCtrl.text = widget.pegawai.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField("NIP", _nipPegawaiCtrl),
              _buildField("Nama Pegawai", _namaPegawaiCtrl),
              _buildField("Tanggal Lahir", _tanggalLahirPegawaiCtrl),
              _buildField("No Telpon", _noTelponPegawaiCtrl),
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
            nomor_telpon: _noTelponPegawaiCtrl.text,
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
      child: const Text("Simpan Perubahan"),
    );
  }

  @override
  void dispose() {
    _nipPegawaiCtrl.dispose();
    _namaPegawaiCtrl.dispose();
    _tanggalLahirPegawaiCtrl.dispose();
    _noTelponPegawaiCtrl.dispose();
    _emailPegawaiCtrl.dispose();
    _passwordPegawaiCtrl.dispose();
    super.dispose();
  }
}
