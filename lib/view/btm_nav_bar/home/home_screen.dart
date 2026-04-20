import 'package:auth_api_integration/res/utils/app_routes.dart';
import 'package:auth_api_integration/view/btm_nav_bar/home/widgets/product_card.dart';
import 'package:auth_api_integration/view_model/btm_nav_bar/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final vm = context.read<HomeViewModel>();

    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        vm.getAllProducts(loadMore: true);
      }
    });
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Products"), centerTitle: true),

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.products.isEmpty
          ? const Center(child: Text("No products found"))
          : GridView.builder(
              controller: _controller,
              padding: const EdgeInsets.all(12),
              itemCount: vm.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final product = vm.products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.productDetails,
                      arguments: vm.products[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
