import 'package:flutter/material.dart';

class ZoomImagePage extends StatelessWidget {
  final String imageUrl;

  const ZoomImagePage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, 
          minScale: 0.1, 
          maxScale: 5.0, 
          child: Image.network(imageUrl), 
        ),
      ),
    );
  }
}
