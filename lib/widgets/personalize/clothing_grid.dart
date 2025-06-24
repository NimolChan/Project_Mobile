import 'package:flutter/material.dart';
// import '../../../data/dummy_data.dart';
import '../../utils/model.dart';
// import '../common/clothing_item.dart';
import '../common/clothing_card.dart';
import '../../utils/data.dart'
    as data; // This should contain clothingItems list

class ClothingGrid extends StatelessWidget {
  final String? selectedCategory;
  final Color? selectedColor;
  final String mode; // 'category' or 'color'
  final int? limit; // Add this

  const ClothingGrid({
    super.key,
    this.selectedCategory,
    this.selectedColor,
    required this.mode,
    this.limit, // Add this
  });

  @override
  Widget build(BuildContext context) {
    List<ClothingItem> filteredItems = [];

    if (mode == 'category' && selectedCategory != null) {
      final category = selectedCategory?.trim().toLowerCase() ?? "all";
      filteredItems =
          category == "all"
              ? data.clothingItems
              : data.clothingItems
                  .where(
                    (item) =>
                        item.tag.any((t) => t.trim().toLowerCase() == category),
                  )
                  .toList();
    } else if (mode == 'color') {
      filteredItems =
          selectedColor == null
              ? data.clothingItems
              : data.clothingItems
                  .where((item) => item.colorTag.value == selectedColor!.value)
                  .toList();
    }

    // Limit to 4 items if limit is set
    if (limit != null && filteredItems.length > limit!) {
      filteredItems = filteredItems.sublist(0, limit!);
    }

    if (filteredItems.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text(
            "No matching outfits found.",
            style: TextStyle(
              fontFamily: 'Merienda One',
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return ClothingCard(
          id: item.id,
          name: item.name,
          tag: item.tag,
          image: item.image,
        );
      },
    );
  }
}
