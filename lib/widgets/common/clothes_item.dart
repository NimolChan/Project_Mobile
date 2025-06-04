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
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('$type - Size $size • $color'),
            Text('Price: \$${price.toStringAsFixed(2)}'),
            Text('Available at: ${location.join(", ")}'),
            Wrap(
              spacing: 6,
              children: tag
                  .map((t) => Chip(
                        label: Text(t),
                        backgroundColor: Colors.grey[200],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
