import 'package:flutter/material.dart';

class ClothesItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final double width;
  final BoxFit? fit;

  const ClothesItem({
    super.key,
    required this.item,
    required this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width, // Make it square
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      item['image'].toString().startsWith('assets/')
                          ? Image.asset(
                            item['image'],
                            width: double.infinity,
                            height: double.infinity,
                            fit: fit,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image, size: 100),
                          )
                          : Image.network(
                            item['image'],
                            width: double.infinity,
                            height: double.infinity,
                            fit: fit,
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
