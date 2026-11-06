import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final String label;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    this.label = 'Sibu Esplanade Landmark',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}