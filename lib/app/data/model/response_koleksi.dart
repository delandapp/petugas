/// status : 200
/// message : "success"
/// data : [{"id":2,"user_id":2,"book_id":1,"created_at":"2024-01-09T05:51:05.000000Z","updated_at":"2024-01-09T05:51:05.000000Z","book":{"id":1,"judul":"Belajar mengenal angka","penulis":"kusnaidi","penerbit":"PT alangka","tahun_terbit":2024,"kategori_id":1,"kategori":{"id":1,"nama":"umum"}}},{"id":1,"user_id":2,"book_id":1,"created_at":"2024-01-09T05:50:44.000000Z","updated_at":"2024-01-09T05:50:44.000000Z","book":{"id":1,"judul":"Belajar mengenal angka","penulis":"kusnaidi","penerbit":"PT alangka","tahun_terbit":2024,"kategori_id":1,"kategori":{"id":1,"nama":"umum"}}}]

class ResponseKoleksi {
  ResponseKoleksi({
      this.status, 
      this.message, 
      this.data,});

  ResponseKoleksi.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKoleksi.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataKoleksi>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// user_id : 2
/// book_id : 1
/// created_at : "2024-01-09T05:51:05.000000Z"
/// updated_at : "2024-01-09T05:51:05.000000Z"
/// book : {"id":1,"judul":"Belajar mengenal angka","penulis":"kusnaidi","penerbit":"PT alangka","tahun_terbit":2024,"kategori_id":1,"kategori":{"id":1,"nama":"umum"}}

class DataKoleksi {
  DataKoleksi({
      this.id, 
      this.userId, 
      this.bookId, 
      this.createdAt, 
      this.updatedAt, 
      this.book,});

  DataKoleksi.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  int? id;
  int? userId;
  int? bookId;
  String? createdAt;
  String? updatedAt;
  Book? book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (book != null) {
      map['book'] = book?.toJson();
    }
    return map;
  }

}

/// id : 1
/// judul : "Belajar mengenal angka"
/// penulis : "kusnaidi"
/// penerbit : "PT alangka"
/// tahun_terbit : 2024
/// kategori_id : 1
/// kategori : {"id":1,"nama":"umum"}

class Book {
  Book({
      this.id, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.kategoriId, 
      this.kategori,});

  Book.fromJson(dynamic json) {
    id = json['id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    kategoriId = json['kategori_id'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }
  int? id;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  int? kategoriId;
  Kategori? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['kategori_id'] = kategoriId;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "umum"

class Kategori {
  Kategori({
      this.id, 
      this.nama,});

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
  }
  int? id;
  String? nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }

}