import 'package:flutter/material.dart';
import 'package:stylishcloset/utils/data.dart';

class ClothingItem {
  final int id;
  final String name;
  final String color;
  final Color colorTag;
  final String selectTag;
  final String size;
  final List<String> location;
  final List<String> tag;
  final String type;
  final double price;
  final String image;
  // final String category;

  ClothingItem({
    required this.id,
    required this.name,
    required this.color,
    required this.colorTag,
    required this.selectTag,
    required this.size,
    required this.location,
    required this.tag,
    required this.type,
    required this.price,
    required this.image,
    // required this.category,
  });

  factory ClothingItem.fromMap(Map<String, dynamic> map) {
    return ClothingItem(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      colorTag: map['colorTag'],
      selectTag: map['selectedtag'] ?? '',
      size: map['size'],
      location: List<String>.from(map['location']),
      tag: List<String>.from(map['tag']),
      type: map['type'],
      price: (map['price'] as num).toDouble(),
      image: map['image'],
      // category: map['category'] ?? 'All',
    );
  }
}

final List<ClothingItem> clothingItems =
    clothes
        .where((item) => item.containsKey('tag')) // optional, but helps
        .map((item) => ClothingItem.fromMap(item))
        .toList();
