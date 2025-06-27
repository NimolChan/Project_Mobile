import 'package:flutter/material.dart';
import '../../utils/data.dart' as data;
import '../common/clothing_card.dart';
import '../../utils/model.dart';

class AllItemsPage extends StatelessWidget {
  final String category;
  final Color? selectedColor;

  const AllItemsPage({super.key, required this.category, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    // Start by loading all clothing items from data
    List<ClothingItem> filtered = data.clothingItems;
  // If a color is selected, filter the items by matching color
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
           // Return a ClothingCard widget for each item in the grid
          return ClothingCard(
            id: item.id,
            name: item.name,
            color: item.color, 
            size: item.size, 
            location: item.location, 
            tag: item.tag,
            image: item.image,
            isFavorite: false, 
            onFavoriteToggle: () {
            },
          );
        },
      ),
    );
  }
}
