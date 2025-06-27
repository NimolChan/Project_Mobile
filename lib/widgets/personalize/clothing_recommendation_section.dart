import 'package:flutter/material.dart';
import 'recommendation_dropdown.dart';
import 'color_picker.dart';
import '../../utils/data.dart';
import '../common/clothing_card.dart';
import 'all_items_page.dart';

class ClothingRecommendationSection extends StatefulWidget {
  const ClothingRecommendationSection({super.key});

  @override
  State<ClothingRecommendationSection> createState() =>
      _ClothingRecommendationSectionState();
}

class _ClothingRecommendationSectionState
    extends State<ClothingRecommendationSection> {
  String selectedTag = 'All';
  String selectedSubTag = 'All';
  Color? selectedColor;
  String activeMode = 'category';

  // Helper to get all unique tags from your data
  List<String> getAllTags() {
    final tags = <String>{};
    for (final item in clothingItems) {
      tags.addAll(item.tag.map((t) => t.trim().toLowerCase()));
    }
    return ['all', ...tags.toList()..sort()];
  }

  String displayTag(String tag) {
    if (tag == 'all') return 'All';
    return tag[0].toUpperCase() + tag.substring(1);
  }

  @override
  Widget build(BuildContext context) {

    // Main tag/category filter
    final filteredByTag =
        selectedTag.toLowerCase() == 'all'
            ? clothingItems
            : clothingItems.where((item) {
              final match = item.tag.any((t) {
                final tagValue = t.trim().toLowerCase();
                final selectedValue = selectedTag.trim().toLowerCase();
                final isMatch = tagValue == selectedValue;

                return isMatch;
              });
              return match;
            }).toList();

    // Sub-tag filter (only applies when main filter is "All" and sub-tag is not "All")
    final filteredBySubTag =
        (selectedTag.toLowerCase() == 'all' &&
                selectedSubTag.toLowerCase() != 'all')
            ? filteredByTag.where((item) {
              final match = item.tag.any((t) {
                final tagValue = t.trim().toLowerCase();
                final selectedValue = selectedSubTag.trim().toLowerCase();
                final isMatch = tagValue == selectedValue;
                return isMatch;
              });
              return match;
            }).toList()
            : filteredByTag;

    // Color filter
    final filteredByColor =
        selectedColor == null
            ? clothingItems
            : clothingItems
                .where((item) => item.colorTag.value == selectedColor!.value)
                .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ChoiceChip(
              label: const Text('Style'),
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

        if (activeMode == 'category') ...[
          RecommendationDropdown(
            selected: selectedTag, // use the original tag value
            onChanged: (value) {
              setState(() {
                selectedTag = value;
                selectedSubTag = 'all'; // Reset sub-tag when main tag changes
              });
            },
            option: getAllTags(), // use the original tag values
          ),
          // Show sub-tag filter only when "All" is selected in main filter
          if (selectedTag.toLowerCase() == 'all') ...[
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedSubTag, // use the original tag value
              items:
                  getAllTags()
                      .map(
                        (tag) => DropdownMenuItem(
                          value: tag,
                          child: Text(displayTag(tag)),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubTag = value!;
                });
              },
            ),
          ],
          const SizedBox(height: 12),
          filteredBySubTag.isEmpty
              ? const Center(child: Text('No matching outfits found.'))
              : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredBySubTag.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final item = filteredBySubTag[index];
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
                      // item.isFavorite = !item.isFavorite;
                    },
                  );
                },
              ),
        ],

        if (activeMode == 'color') ...[
          ColorPicker(
            selectedColor: selectedColor,
            onColorSelected: (color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
          const SizedBox(height: 12),
          filteredByColor.isEmpty
              ? const Center(child: Text('No matching outfits found.'))
              : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredByColor.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final item = filteredByColor[index];
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
                      // item.isFavorite = !item.isFavorite;
                    },
                  );
                },
              ),
        ],

        const SizedBox(height: 16),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AllItemsPage(category: selectedTag),
                ),
              );
            },
            child: const Text(
              'View all',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
