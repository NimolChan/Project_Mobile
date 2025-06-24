import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';

class CollectionItem {
  final String id;
  final String imagePath;
  final bool isFileImage;
  final String tag;
  final Uint8List? imageBytes;

  CollectionItem({
    required this.id,
    required this.imagePath,
    this.isFileImage = false,
    required this.tag,
    this.imageBytes,
  });
}

// Global list for user-created items
List<CollectionItem> userCreatedItems = [];