import 'package:flutter/material.dart';
import 'recommendation_dropdown.dart';
import '../../../data/dummy_data.dart';

class ClothingGrid extends StatelessWidget {
  final String? selectedCategory;
  final Color? selectedColor;
  final String mode; // 'category' or 'color'

  const ClothingGrid({
    super.key,
    this.selectedCategory,
    this.selectedColor,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    List filteredItems = [];

    if (mode == 'category' && selectedCategory != null) {
      filteredItems = selectedCategory == "All"
          ? clothingItems
          : clothingItems
              .where((item) => item.category == selectedCategory)
              .toList();
    } else if (mode == 'color') {
      filteredItems = selectedColor == null
          ? clothingItems
          : clothingItems
              .where((item) => item.colorTag.value == selectedColor!.value)
              .toList();
    }

    if (filteredItems.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Center(child: Text("No matching outfits found.")),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return ClothingItemCard(item: filteredItems[index]);
          },
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () {
            // Optional: Navigate to all outfits
          },
          child: const Text(
            "View all",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF3949AB),
              fontWeight: FontWeight.w500,
              fontFamily: 'Merienda One',
            ),
          ),
        ),
      ],
    );
  }
}
