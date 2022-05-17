class Item {
  final int id;

  final String ten, tenav, mota, motaav, loai, hinhanh, created_at, updated_at;

  Item(
      {required this.mota,
      required this.motaav,
      required this.loai,
      required this.hinhanh,
      required this.created_at,
      required this.updated_at,
      required this.id,
      required this.ten,
      required this.tenav});
  factory Item.fromJson(Map<String, dynamic> json) {
    var item = Item(
      id: json["id"],
      ten: json["ten"],
      tenav: json["tenav"],
      mota: json["mota"],
      motaav: json["motaav"],
      loai: json["loai"],
      hinhanh: json["hinhanh"],
      created_at: json["created_at"],
      updated_at: json["updated_at"],
    );
    return item;
  }

  get gia => null;
}

class Itemanh {
  final int id, idloai;

  final String hinhanh, created_at, updated_at;

  Itemanh(
      {required this.id,
      required this.idloai,
      required this.hinhanh,
      required this.created_at,
      required this.updated_at});
  factory Itemanh.fromJson(Map<String, dynamic> json) {
    var item = Itemanh(
      id: json["id"],
      idloai: json["idloai"],
      hinhanh: json["hinhanh"],
      created_at: json["created_at"],
      updated_at: json["updated_at"],
    );
    return item;
  }
}
