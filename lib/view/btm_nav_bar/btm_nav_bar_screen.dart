import 'package:auth_api_integration/view_model/auth/auth_view_model.dart';
import 'package:auth_api_integration/view_model/btm_nav_bar/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtmNavBarScreen extends StatefulWidget {
  const BtmNavBarScreen({super.key});

  @override
  State<BtmNavBarScreen> createState() => _BtmNavBarScreenState();
}

class _BtmNavBarScreenState extends State<BtmNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Orders")),
    AccountScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthViewModel>().loadUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

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
                _buildNavItem(Icons.home, "Home", 0),
                _buildNavItem(Icons.search, "Search", 1),
                _buildNavItem(Icons.receipt_long, "Orders", 2),
                _buildNavItem(Icons.person, "Account", 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
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
