import 'package:flutter/material.dart';
import '../../utils/model.dart';

class ClotheItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final double width;
  final BoxFit? fit;
  final Color colorTag;

  const ClotheItem({
    super.key,
    required this.item,
    required this.width,
    this.fit = BoxFit.cover,
    required this.colorTag,
  });

  // factory ClothingItem.fromMap(Map<String, dynamic> map) {
  //   return ClothingItem(
  //     id: map['id'],
  //     name: map['name'],
  //     color: map['color'],
  //     colorTag: map['colorTag'],
  //     size: map['size'],
  //     location: List<String>.from(map['location']),
  //     tag: List<String>.from(map['tag']),
  //     type: map['type'],
  //     price: (map['price'] as num).toDouble(),
  //     image: map['image'],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
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
