import 'package:aurora_website/presentation/home/pages/about_page.dart';
import 'package:aurora_website/presentation/home/pages/contact_page.dart';
import 'package:aurora_website/presentation/home/pages/home_page.dart';
import 'package:aurora_website/presentation/home/pages/services_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ServicesPage(),
    AboutPage(),
    ContactPage(),
  ];

  void _onMenuTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuColor = Theme.of(context).secondaryHeaderColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/logos/Aurora.png', height: 45),
            Row(
              children: [
                _buildMenuButton(context, "Home", 0, menuColor),
                _buildMenuButton(context, "Services", 1, menuColor),
                _buildMenuButton(context, "About Us", 2, menuColor),
                _buildMenuButton(context, "Contact Us", 3, menuColor),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    int index,
    Color menuColor,
  ) {
    return TextButton(
      onPressed: () => _onMenuTap(index),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: _currentIndex == index
              ? Theme.of(context).primaryColor
              : menuColor,
          fontWeight: _currentIndex == index ? FontWeight.w600 : null,
        ),
      ),
    );
  }
}
