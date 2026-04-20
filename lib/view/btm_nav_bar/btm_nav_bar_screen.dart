import 'package:auth_api_integration/view_model/btm_nav_bar/btm_nav_bar_view_model.dart';
import 'package:auth_api_integration/view_model/btm_nav_bar/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtmNavBarScreen extends StatefulWidget {
  const BtmNavBarScreen({super.key});

  @override
  State<BtmNavBarScreen> createState() => _BtmNavBarScreenState();
}

class _BtmNavBarScreenState extends State<BtmNavBarScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BtmNavBarViewModel>();
    return Scaffold(
      body: vm.screens[vm.currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.05)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, "Home", 0, vm),
                _buildNavItem(Icons.search, "Search", 1, vm),
                _buildNavItem(Icons.receipt_long, "Orders", 2, vm),
                _buildNavItem(Icons.person, "Account", 3, vm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    BtmNavBarViewModel vm,
  ) {
    final bool isActive = vm.currentIndex == index;

    return GestureDetector(
      onTap: () {
        vm.setIndex(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: isActive ? Colors.white : Colors.grey),
            if (isActive) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
