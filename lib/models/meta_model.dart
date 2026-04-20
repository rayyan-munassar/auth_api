class MetaModel {
  final String? createdAt, updatedAt, barcode, qrCode;

  MetaModel({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      barcode: json["barcode"],
      qrCode: json["qrCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "barcode": barcode,
      "qrCode": qrCode,
    };
  }
}
