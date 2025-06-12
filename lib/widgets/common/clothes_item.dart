import 'package:flutter/material.dart';

class ClothesItem extends StatelessWidget {
  final int id;
  final String name;
  final String color;
  final String size;
  final List<String> location;
  final List<String> tag;
  final String type;
  final double price;
  final String image;
  // final double height;
  final double width;
  final BoxFit? fit; 

  const ClothesItem({
    super.key,
    required this.id,
    required this.name,
    required this.color,
    required this.size,
    required this.location,
    required this.tag,
    required this.type,
    required this.price,
    required this.image,
    // required this.height,
    required this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // height: height,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    // height: 200,
                    // width: 100,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
