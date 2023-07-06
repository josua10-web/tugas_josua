class Pasien {
  final String nama_pasien;
  final String id;
  final String content;

  const Pasien({
    required this.nama_pasien,
    required this.id,
    required this.content,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
      nama_pasien: json['nama_pasien'],
      id: json['id'],
      content: json['content'],
    );
  }
}
