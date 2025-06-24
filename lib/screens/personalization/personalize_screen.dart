import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';
import '../../widgets/personalize/all_items_page.dart';
import '../../widgets/personalize/tips_carousel.dart';
import '../../widgets/personalize/recommendation_dropdown.dart';
import '../../widgets/personalize/clothing_grid.dart';
import '../../widgets/personalize/color_picker.dart';
import '../../widgets/personalize/random_outfit_section.dart';

class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  State<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
  String selectedCategory = 'All';
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        automaticallyImplyLeading: false, // no default back button
        // Custom layout: logo left, title centered
        title: Stack(
          alignment: Alignment.center,
          children: [
            /// Centered title
            const Text(
              'Personalization',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merienda One',
                color: Colors.black,
              ),
            ),

            /// Left logo
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tips for you",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merienda One',
                ),
              ),
              const SizedBox(height: 12),
              const TipsCarousel(),
              const SizedBox(height: 24),

              const Text(
                "Recommendation",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merienda One',
                ),
              ),
              const SizedBox(height: 12),
              RecommendationDropdown(
                selected: selectedCategory,
                onChanged: (value) {
                  setState(() => selectedCategory = value);
                },
                option: [
                  'All',
                  'Trendy',
                  'Classy',
                  'Formal',
                  'Vintage',
                  'Old Money',
                  'Street wear',
                  'Feminine',
                  'Winter',
                  'Summer',
                  'Sporty',
                  'Acubi',
                ],
              ),
              const SizedBox(height: 12),
              ClothingGrid(
                selectedCategory: selectedCategory,
                selectedColor: null,
                mode: 'category',
                limit: 4, // Show only 4 items
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AllItemsPage(category: selectedCategory),
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
              const SizedBox(height: 24),

              const Text(
                "Match by Color",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merienda One',
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Pick a main color, and see color-matched outfits.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Merienda One',
                ),
              ),
              const SizedBox(height: 12),
              ColorPicker(
                selectedColor: selectedColor,
                onColorSelected: (color) {
                  setState(() => selectedColor = color);
                },
              ),
              const SizedBox(height: 12),
              ClothingGrid(
                selectedCategory: null,
                selectedColor: selectedColor,
                mode: 'color',
                limit: 4, // Show only 4 items
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AllItemsPage(
                              category: 'all',
                              selectedColor:
                                  selectedColor, // Pass the color to AllItemsPage
                            ),
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
              const SizedBox(height: 24),

              const Text(
                "Random Outfit",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merienda One',
                ),
              ),
              const Text(
                "Feeling Lucky? or “Surprise Me”",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Merienda One',
                ),
              ),
              const SizedBox(height: 12),
              const RandomOutfitSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentRoute: '/personal'),
    );
  }
}
