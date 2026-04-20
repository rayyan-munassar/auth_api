import 'package:auth_api_integration/models/product_model.dart';
import 'package:auth_api_integration/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductModel? productModel;
  @override
  void initState() {
    productModel = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double priceBeforeDiscount =
        productModel!.price!.toDouble() +
        productModel!.price!.toDouble() *
            productModel!.discountPercentage!.toDouble();

    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: CustomScrollView(
        slivers: [
          // 🔥 App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                productModel!.thumbnail ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 📦 Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷 Title
                  Text(
                    productModel!.title ?? "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  // ⭐ Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text("${productModel!.rating}"),
                      SizedBox(width: 8),
                      Text(
                        "(${productModel!.reviews!.length} reviews)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 💰 Price Section
                  Row(
                    children: [
                      Text(
                        "\$${productModel!.price}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "\$$priceBeforeDiscount",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "-${productModel!.discountPercentage}",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 📄 Description
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${productModel!.description}",
                    style: TextStyle(color: Colors.black87),
                  ),

                  const SizedBox(height: 20),

                  // 🖼 Image Gallery
                  const Text(
                    "Images",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: productModel!.images!.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return _buildImage(productModel!.images![index]);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 📝 Reviews Preview
                  const Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  ListView.builder(
                    itemCount: productModel!.reviews!.length,
                    itemBuilder: (BuildContext context, int index) {
                      ReviewModel review = productModel!.reviews![index];
                      String? name = review.reviewerName;
                      String? comment = review.comment;
                      double? rating = review.rating!.toDouble();
                      return Expanded(
                        child: _buildReview(name ?? "", rating, comment ?? ""),
                      );
                    },
                  ),

                  const SizedBox(height: 100), // space for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),

      // 🛒 Bottom Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🖼 Image Item
  Widget _buildImage(String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover),
      ),
    );
  }

  // ⭐ Review Item
  Widget _buildReview(String name, double rating, String comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(
                  rating.toInt(),
                  (index) =>
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                ),
              ),
              Text(comment),
            ],
          ),
        ],
      ),
    );
  }
}
