import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/collection/widget/set_collection_widget.dart';

class CollectionDetailPage extends StatelessWidget {
  final String title;

  const CollectionDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Debug print to check the received title
    print('Received title: $title');

    // Define collection data based on title
    List<CollectionItem> items = [];
    if (title == 'Wedding') {
      items = [
        CollectionItem(id: '1', imagePath: 'assets/images/LD1.png'),
        CollectionItem(id: '2', imagePath: 'assets/images/LD2.png'),
        CollectionItem(id: '3', imagePath: 'assets/images/LD3.png'),
        CollectionItem(id: '4', imagePath: 'assets/images/LD4.png'),
        CollectionItem(id: '5', imagePath: 'assets/images/LD5.png'),
        CollectionItem(id: '6', imagePath: 'assets/images/LD6.png'),
        CollectionItem(id: '7', imagePath: 'assets/images/LD7.png'),
        CollectionItem(id: '8', imagePath: 'assets/images/LD8.png'),
      ];
    } else if (title == 'Office') {
      items = [
        CollectionItem(id: '1', imagePath: 'assets/images/OF1.png'),
        CollectionItem(id: '2', imagePath: 'assets/images/OF2.png'),
        CollectionItem(id: '3', imagePath: 'assets/images/OF3.png'),
        CollectionItem(id: '4', imagePath: 'assets/images/OF4.png'),
        CollectionItem(id: '5', imagePath: 'assets/images/OF5.png'),
        CollectionItem(id: '6', imagePath: 'assets/images/OF6.png'),
        CollectionItem(id: '7', imagePath: 'assets/images/OF7.png'),
        CollectionItem(id: '8', imagePath: 'assets/images/OF8.png'),
        CollectionItem(id: '9', imagePath: 'assets/images/OF9.png'),
        CollectionItem(id: '10', imagePath: 'assets/images/OF10.png'),
        CollectionItem(id: '11', imagePath: 'assets/images/OF11.png'),
        CollectionItem(id: '12', imagePath: 'assets/images/OF12.png'),
        CollectionItem(id: '13', imagePath: 'assets/images/OF13.png'),
      ];
    } else if (title == 'Party') {
      items = [
        CollectionItem(id: '1', imagePath: 'assets/images/PT1.png'),
        CollectionItem(id: '2', imagePath: 'assets/images/PT2.png'),
        CollectionItem(id: '3', imagePath: 'assets/images/PT3.png'),
        CollectionItem(id: '4', imagePath: 'assets/images/PT4.png'),
        CollectionItem(id: '5', imagePath: 'assets/images/PT5.png'),
        CollectionItem(id: '6', imagePath: 'assets/images/PT6.png'),
        CollectionItem(id: '7', imagePath: 'assets/images/PT7.png'),
        CollectionItem(id: '8', imagePath: 'assets/images/PT8.png'),
        CollectionItem(id: '9', imagePath: 'assets/images/PT9.png'),
        CollectionItem(id: '10', imagePath: 'assets/images/PT10.png'),
        CollectionItem(id: '11', imagePath: 'assets/images/PT11.png'),
        CollectionItem(id: '12', imagePath: 'assets/images/PT12.png'),
        CollectionItem(id: '13', imagePath: 'assets/images/PT13.png'),
      ];
    } else if (title == 'Relax') {
      items = [
        CollectionItem(id: '1', imagePath: 'assets/images/RL1.png'),
        CollectionItem(id: '2', imagePath: 'assets/images/RL2.png'),
        CollectionItem(id: '3', imagePath: 'assets/images/RL3.png'),
        CollectionItem(id: '4', imagePath: 'assets/images/RL4.png'),
        CollectionItem(id: '5', imagePath: 'assets/images/RL5.png'),
        CollectionItem(id: '6', imagePath: 'assets/images/RL6.png'),
        CollectionItem(id: '7', imagePath: 'assets/images/RL7.png'),
        CollectionItem(id: '8', imagePath: 'assets/images/RL8.png'),
        CollectionItem(id: '9', imagePath: 'assets/images/RL9.png'),
      ];
    }

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
}