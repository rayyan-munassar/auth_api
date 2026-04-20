import 'package:auth_api_integration/models/dimension_model.dart';
import 'package:auth_api_integration/models/meta_model.dart';
import 'package:auth_api_integration/models/review_model.dart';

class ProductModel {
  final int? id, stock, minimumOrderQuantity, weight;
  final String? title,
      description,
      category,
      brand,
      sku,
      warrantyInformation,
      shippingInformation,
      availabilityStatus,
      returnPolicy,
      thumbnail;

  final double? price, discountPercentage, rating;

  final List<dynamic>? tags, images;
  final DimensionModel? dimensions;
  final MetaModel? meta;

  final List<ReviewModel>? reviews;

  ProductModel({
    this.id,
    this.stock,
    this.minimumOrderQuantity,
    this.title,
    this.description,
    this.category,
    this.brand,
    this.sku,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.returnPolicy,
    this.thumbnail,
    this.price,
    this.discountPercentage,
    this.rating,
    this.weight,
    this.tags, // list of string
    this.images, // list of string
    this.dimensions, // model
    this.meta, // model
    this.reviews, // model
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      stock: json["stock"],
      minimumOrderQuantity: json["minimumOrderQuantity"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      brand: json["brand"],
      sku: json["sku"],
      warrantyInformation: json["warrantyInformation"],
      shippingInformation: json["shippingInformation"],
      availabilityStatus: json["availabilityStatus"],
      returnPolicy: json["returnPolicy"],
      thumbnail: json["thumbnail"],
      price: (json["price"] as num).toDouble(),
      discountPercentage: (json["discountPercentage"] as num).toDouble(),
      rating: (json["rating"] as num).toDouble(),
      weight: json["weight"],
      tags: json["tags"],
      images: json["images"],
      dimensions: DimensionModel.fromJson(json["dimensions"]),
      meta: MetaModel.fromJson(json["meta"]),
      reviews: (json["reviews"] as List)
          .map((r) => ReviewModel.fromJson(r))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "stock": stock,
      "minimumOrderQuantity": minimumOrderQuantity,
      "title": title,
      "description": description,
      "category": category,
      "brand": brand,
      "sku": sku,
      "warrantyInformation": warrantyInformation,
      "shippingInformation": shippingInformation,
      "availabilityStatus": availabilityStatus,
      "returnPolicy": returnPolicy,
      "thumbnail": thumbnail,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "weight": weight,
      "tags": tags,
      "images": images,
      "dimensions": dimensions!.toJson(),
      "meta": meta!.toJson(),
      "reviews": reviews!.map((r) => r.toJson()).toList(),
    };
  }
}
