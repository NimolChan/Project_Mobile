import 'package:flutter/material.dart';
import 'recommendation_dropdown.dart';
import 'clothing_grid.dart';
import 'color_picker.dart';

class ClothingRecommendationSection extends StatefulWidget {
  const ClothingRecommendationSection({super.key});

  @override
  State<ClothingRecommendationSection> createState() =>
      _ClothingRecommendationSectionState();
}

class _ClothingRecommendationSectionState
    extends State<ClothingRecommendationSection> {
  String selectedCategory = 'All';
  //String selectedColor = 'null';
  Color? selectedColor;
  String activeMode = 'category';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ChoiceChip(
              label: const Text('Category'),
              selected: activeMode == 'category',
              onSelected: (_) => setState(() => activeMode = 'category'),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Color'),
              selected: activeMode == 'color',
              onSelected: (_) => setState(() => activeMode = 'color'),
            ),
          ],
        ),
        const SizedBox(height: 16),

        if (activeMode == 'category')
          RecommendationDropdown(
            selected: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),

        const SizedBox(height: 12),
        // Category Grid
        ClothingGrid(mode: 'category', selectedCategory: selectedCategory),
        const SizedBox(height: 24),

        // Color Picker
        ColorPicker(
          onColorSelected: (colors) {
            setState(() {
              selectedColor = colors;
            });
          },
        ),
        const SizedBox(height: 12),

        // Color Grid
        ClothingGrid(mode: 'color', selectedColor: selectedColor),
      ],
    );
  }
}
