import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/repository/screens/homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Orders Management")),
    const Center(child: Text("Product Catelog")),
    const Center(child: Text("Customer Insights")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DpShop",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16, left: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/100023483?v=4',
                ),
              ),
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_rounded),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: "Customers",
          ),
        ],
      ),
    );
  }
}
