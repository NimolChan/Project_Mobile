import 'package:flutter/material.dart';

class CartCollection extends StatelessWidget {
  final String title;
  final String image;
  final String color; // Expect hex color like '0xFF8B7C7A'

  const CartCollection({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: sizeHeight * 0.15, // responsive height
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: _parseColor(color),
        child: Row(
          children: [
            // Text section
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Cursive',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Image section
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain, // keep image centered and visible
                    height: double.infinity, // responsive width
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Parses a hex color string like '0xFF8B7C7A' to a Color object.
  Color _parseColor(String hex) {
    try {
      return Color(int.parse(hex));
    } catch (_) {
      return Colors.grey; // Fallback color on error
    }
  }
}
