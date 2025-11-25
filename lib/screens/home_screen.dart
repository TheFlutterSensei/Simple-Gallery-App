import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gallery/main.dart';
import 'package:simple_gallery/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _images = [
    'assets/images/photo1.jpg',
    'assets/images/photo2.jpg',
    'assets/images/photo3.jpg',
    'assets/images/photo4.jpg',
    'assets/images/photo5.jpg',
    'assets/images/photo6.jpg',
    'assets/images/photo7.jpg',
    'assets/images/photo8.jpg',
    'assets/images/photo9.jpg',
    'assets/images/photo10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Gallery'),
        actions: [
          IconButton(
            onPressed: themeProvider.toggleTheme,
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final imagePath = _images[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(imagePath: imagePath),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: imagePath,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
