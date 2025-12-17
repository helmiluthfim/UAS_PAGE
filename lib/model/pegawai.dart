class Pegawai {
  int? id;
  String nip;
  String nama;
  String tanggal_lahir;
  String nomor_telpon;
  String email;
  String password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggal_lahir,
    required this.nomor_telpon,
    required this.email,
    required this.password,
  });
}
