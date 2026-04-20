class DimensionModel {
  final double? width, height, depth;

  DimensionModel({this.width, this.height, this.depth});

  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
      width: json["width"],
      height: json["height"],
      depth: json["depth"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"width": width, "height": height, "depth": depth};
  }
}
