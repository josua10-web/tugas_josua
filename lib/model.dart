class Poli {
  final String id;
  final String nama_poli;

  Poli({
    required this.id,
    required this.nama_poli,
  });

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
      id: json['id'],
      nama_poli: json['nama_poli'],
    );
  }
}
