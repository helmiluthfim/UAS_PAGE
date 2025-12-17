class Pasien {
  String? id;
  String nomor_rm;
  String nama_pasien;
  String tanggal_lahir;
  String nomor_telpon;
  String alamat;

  Pasien({
    this.id,
    required this.nomor_rm,
    required this.nama_pasien,
    required this.tanggal_lahir,
    required this.nomor_telpon,
    required this.alamat,
  });

  factory Pasien.romJson(Map<String, dynamic> json) => Pasien(
    id: json["id"],
    nomor_rm: json["no_rm"],
    nama_pasien: json["nama_pasien"],
    tanggal_lahir: json["tanggal_lahir"],
    nomor_telpon: json["nomor_telpon"],
    alamat: json["alamat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "no_rm": nomor_rm,
    "nama_pasien": nama_pasien,
    "tanggal_lahir": tanggal_lahir,
    "nomor_telpon": nomor_telpon,
    "alamat": alamat,
  };
}
