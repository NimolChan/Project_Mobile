import 'package:flutter/material.dart';
import '../common/clothing_item.dart';
import '../../utils/data.dart' as data;
import '../common/clothing_card.dart';
import '../../utils/model.dart';

class AllItemsPage extends StatelessWidget {
  final String category;
  final Color? selectedColor;

  const AllItemsPage({super.key, required this.category, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    List<ClothingItem> filtered = data.clothingItems;

    if (selectedColor != null) {
      filtered =
          filtered
              .where((item) => item.colorTag.value == selectedColor!.value)
              .toList();
    } else if (category.toLowerCase() != 'all') {
      filtered =
          filtered
              .where(
                (item) => item.tag.any(
                  (t) =>
                      t.trim().toLowerCase() == category.trim().toLowerCase(),
                ),
              )
              .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedColor != null
              ? 'All Outfits by Color'
              : category[0].toUpperCase() + category.substring(1),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filtered.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final item = filtered[index];
          return ClothingCard(
            id: item.id,
            name: item.name,
            tag: item.tag,
            image: item.image,
          );
        },
      ),
    );
  }
}
