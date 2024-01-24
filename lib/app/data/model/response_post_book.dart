/// status : 201
/// message : "success"
/// data : {"kategori_id":1,"judul":"Flutter Getx","penulis":"romli kusnadi","penerbit":"PT Damai Sejahtera","tahun_terbit":2023,"updated_at":"2024-01-12T08:39:03.000000Z","created_at":"2024-01-12T08:39:03.000000Z","id":3}

class ResponsePostBook {
  ResponsePostBook({
      this.status, 
      this.message, 
      this.data,});

  ResponsePostBook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// kategori_id : 1
/// judul : "Flutter Getx"
/// penulis : "romli kusnadi"
/// penerbit : "PT Damai Sejahtera"
/// tahun_terbit : 2023
/// updated_at : "2024-01-12T08:39:03.000000Z"
/// created_at : "2024-01-12T08:39:03.000000Z"
/// id : 3

class Data {
  Data({
      this.kategoriId, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  int? kategoriId;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}