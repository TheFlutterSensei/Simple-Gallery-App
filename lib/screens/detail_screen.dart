import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  const DetailScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Viewer')),
      body: Center(
        child: Hero(tag: imagePath, child: Image.asset(imagePath)),
      ),
    );
  }
}
