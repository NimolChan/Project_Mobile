import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:stylishcloset/utils/model.dart' as model;
import 'package:stylishcloset/screens/collection/widget/set_collection_widget.dart';

class CollectionDetailPage extends StatelessWidget {
  final String title;

  const CollectionDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    List<model.CollectionItem> items = [];
    // Define userCreatedItems as an empty list or fetch from your data source
    List<model.CollectionItem> userCreatedItems = [];

    if (title == 'Wedding') {
      items = [
        model.CollectionItem(id: '1', imagePath: 'assets/images/LD1.png', tag: 'Wedding'),
        model.CollectionItem(id: '2', imagePath: 'assets/images/LD2.png', tag: 'Wedding'),
        model.CollectionItem(id: '3', imagePath: 'assets/images/LD3.png', tag: 'Wedding'),
        model.CollectionItem(id: '4', imagePath: 'assets/images/LD4.png', tag: 'Wedding'),
        model.CollectionItem(id: '5', imagePath: 'assets/images/LD5.png', tag: 'Wedding'),
        model.CollectionItem(id: '6', imagePath: 'assets/images/LD6.png', tag: 'Wedding'),
        model.CollectionItem(id: '7', imagePath: 'assets/images/LD7.png', tag: 'Wedding'),
        model.CollectionItem(id: '8', imagePath: 'assets/images/LD8.png', tag: 'Wedding'),
      ];
    } else if (title == 'Office') {
      items = [
        model.CollectionItem(id: '1', imagePath: 'assets/images/OF1.png', tag: 'Office'),
        model.CollectionItem(id: '2', imagePath: 'assets/images/OF2.png', tag: 'Office'),
        model.CollectionItem(id: '3', imagePath: 'assets/images/OF3.png', tag: 'Office'),
        model.CollectionItem(id: '4', imagePath: 'assets/images/OF4.png', tag: 'Office'),
        model.CollectionItem(id: '5', imagePath: 'assets/images/OF5.png', tag: 'Office'),
        model.CollectionItem(id: '6', imagePath: 'assets/images/OF6.png', tag: 'Office'),
        model.CollectionItem(id: '7', imagePath: 'assets/images/OF7.png', tag: 'Office'),
        model.CollectionItem(id: '8', imagePath: 'assets/images/OF8.png', tag: 'Office'),
        model.CollectionItem(id: '9', imagePath: 'assets/images/OF9.png', tag: 'Office'),
        model.CollectionItem(id: '10', imagePath: 'assets/images/OF10.png', tag: 'Office'),
        model.CollectionItem(id: '11', imagePath: 'assets/images/OF11.png', tag: 'Office'),
        model.CollectionItem(id: '12', imagePath: 'assets/images/OF12.png', tag: 'Office'),
        model.CollectionItem(id: '13', imagePath: 'assets/images/OF13.png', tag: 'Office'),
      ];
    } else if (title == 'Party') {
      items = [
        model.CollectionItem(id: '1', imagePath: 'assets/images/PT1.png', tag: 'Party'),
        model.CollectionItem(id: '2', imagePath: 'assets/images/PT2.png', tag: 'Party'),
        model.CollectionItem(id: '3', imagePath: 'assets/images/PT3.png', tag: 'Party'),
        model.CollectionItem(id: '4', imagePath: 'assets/images/PT4.png', tag: 'Party'),
        model.CollectionItem(id: '5', imagePath: 'assets/images/PT5.png', tag: 'Party'),
        model.CollectionItem(id: '6', imagePath: 'assets/images/PT6.png', tag: 'Party'),
        model.CollectionItem(id: '7', imagePath: 'assets/images/PT7.png', tag: 'Party'),
        model.CollectionItem(id: '8', imagePath: 'assets/images/PT8.png', tag: 'Party'),
        model.CollectionItem(id: '9', imagePath: 'assets/images/PT9.png', tag: 'Party'),
        model.CollectionItem(id: '10', imagePath: 'assets/images/PT10.png', tag: 'Party'),
        model.CollectionItem(id: '11', imagePath: 'assets/images/PT11.png', tag: 'Party'),
        model.CollectionItem(id: '12', imagePath: 'assets/images/PT12.png', tag: 'Party'),
        model.CollectionItem(id: '13', imagePath: 'assets/images/PT13.png', tag: 'Party'),
      ];
    } else if (title == 'Relax') {
      items = [
        model.CollectionItem(id: '1', imagePath: 'assets/images/RL1.png', tag: 'Relax'),
        model.CollectionItem(id: '2', imagePath: 'assets/images/RL2.png', tag: 'Relax'),
        model.CollectionItem(id: '3', imagePath: 'assets/images/RL3.png', tag: 'Relax'),
        model.CollectionItem(id: '4', imagePath: 'assets/images/RL4.png', tag: 'Relax'),
        model.CollectionItem(id: '5', imagePath: 'assets/images/RL5.png', tag: 'Relax'),
        model.CollectionItem(id: '6', imagePath: 'assets/images/RL6.png', tag: 'Relax'),
        model.CollectionItem(id: '7', imagePath: 'assets/images/RL7.png', tag: 'Relax'),
        model.CollectionItem(id: '8', imagePath: 'assets/images/RL8.png', tag: 'Relax'),
        model.CollectionItem(id: '9', imagePath: 'assets/images/RL9.png', tag: 'Relax'),
      ];
    }

    // Add user-created items for this tag
    items.addAll(userCreatedItems.where((item) => item.tag == title));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'No items available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : SetCollectionWidget(
              collectionTitle: title,
              items: items,
              isGridView: true,
              crossAxisCount: 2,
            ),
    );
  }

  Widget _buildCollectionItemCard(model.CollectionItem item, {bool isListItem = false}) {
    return Card(
      child: Column(
        children: [
          item.isFileImage
              ? Image.file(File(item.imagePath), height: 100, fit: BoxFit.cover)
              : Image.asset(item.imagePath, height: 100, fit: BoxFit.cover),
          // ...other widgets...
        ],
      ),
    );
  }

  Widget _buildGridItemContent(model.CollectionItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: item.isFileImage
                ? (kIsWeb && item.imageBytes != null
                    ? Image.memory(
                        item.imageBytes!,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(item.imagePath),
                        fit: BoxFit.cover,
                      ))
                : Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}