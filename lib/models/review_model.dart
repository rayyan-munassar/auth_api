class ReviewModel {
  final int? rating;
  final String? comment, date, reviewerName, reviewerEmail;

  ReviewModel({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic>? json) {
    return ReviewModel(
      rating: json!["rating"],
      comment: json["comment"],
      date: json["date"],
      reviewerName: json["reviewerName"],
      reviewerEmail: json["reviewerEmail"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
      "comment": comment,
      "date": date,
      "reviewerName": reviewerName,
      "reviewerEmail": reviewerEmail,
    };
  }
}
