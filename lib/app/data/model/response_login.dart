/// status : 200
/// message : "Login Success"
/// data : {"id":1,"username":"testing","nama":"Romli","telp":"085334","alamat":"Solo","role":"PETUGAS","created_at":"2024-01-09T01:55:16.000000Z","updated_at":"2024-01-09T01:55:16.000000Z"}

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataLogin? data;

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

/// id : 1
/// username : "testing"
/// nama : "Romli"
/// telp : "085334"
/// alamat : "Solo"
/// role : "PETUGAS"
/// created_at : "2024-01-09T01:55:16.000000Z"
/// updated_at : "2024-01-09T01:55:16.000000Z"

class DataLogin {
  DataLogin({
      this.id, 
      this.username, 
      this.nama, 
      this.telp, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataLogin.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    telp = json['telp'];
    alamat = json['alamat'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? username;
  String? nama;
  String? telp;
  String? alamat;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['nama'] = nama;
    map['telp'] = telp;
    map['alamat'] = alamat;
    map['role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}