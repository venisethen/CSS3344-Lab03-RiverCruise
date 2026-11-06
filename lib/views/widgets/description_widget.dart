import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  final bool showHeader;

  const DescriptionWidget({
    super.key,
    required this.text,
    this.showHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'About the Destination',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}