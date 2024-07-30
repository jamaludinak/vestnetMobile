
class ProyekModel {
  final int idProyek;
  final String namaProyek;
  final String url;
  final String deskripsi;
  final double minInvest;
  final double target;
  final double investasiTerkumpul;
  final String desa;
  final String kecamatan;
  final String kabupaten;
  final double roi;
  final double bep;
  final String status;

  ProyekModel({
    required this.idProyek,
    required this.namaProyek,
    required this.url,
    required this.deskripsi,
    required this.minInvest,
    required this.target,
    required this.investasiTerkumpul,
    required this.desa,
    required this.kecamatan,
    required this.kabupaten,
    required this.roi,
    required this.bep,
    required this.status,
  });

  factory ProyekModel.fromJson(Map<String, dynamic> json) {
    return ProyekModel(
      idProyek: json['id_proyek'] as int,
      namaProyek: json['nama_proyek'] as String,
      url: json['url'] as String,
      deskripsi: json['deskripsi'] as String,
      minInvest: (json['min_invest'] as num).toDouble(),
      target: (json['target'] as num).toDouble(),
      investasiTerkumpul: (json['nominal_investasi_terkumpul'] as num).toDouble(),
      desa: json['desa'] as String,
      kecamatan: json['kecamatan'] as String,
      kabupaten: json['kabupaten'] as String,
      roi: (json['roi'] as num).toDouble(),
      bep: (json['bep'] as num).toDouble(),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_proyek': idProyek,
      'nama_proyek': namaProyek,
      'url': url,
      'deskripsi': deskripsi,
      'min_invest': minInvest,
      'target': target,
      'nominal_investasi_terkumpul': investasiTerkumpul,
      'desa': desa,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'roi': roi,
      'bep': bep,
      'status': status,
    };
  }
}