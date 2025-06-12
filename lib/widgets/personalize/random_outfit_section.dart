import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart';

class RandomOutfitSection extends StatefulWidget {
  const RandomOutfitSection({super.key});

  @override
  State<RandomOutfitSection> createState() => _RandomOutfitSectionState();
}

class _RandomOutfitSectionState extends State<RandomOutfitSection> {
  List<String> outfitImages = [];

  @override
  void initState() {
    super.initState();
    generateNewOutfit(); // Load initial outfits
  }

  void generateNewOutfit() {
    clothingItems.shuffle();
    outfitImages = clothingItems.take(4).map((item) => item.image).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: outfitImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 218, 222),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    outfitImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: generateNewOutfit,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                "Generate Random Outfit",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Merienda One',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
