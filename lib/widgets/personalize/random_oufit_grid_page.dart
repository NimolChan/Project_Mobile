import 'package:flutter/material.dart';
import '../../utils/data.dart';

class RandomOutfitGridPage extends StatefulWidget {
  final Map<String, String>? initialOutfit;
  const RandomOutfitGridPage({super.key, this.initialOutfit});

  @override
  State<RandomOutfitGridPage> createState() => _RandomOutfitGridPageState();
}

class _RandomOutfitGridPageState extends State<RandomOutfitGridPage> {
  late Map<String, String> selectedImages;

  final List<List<String>> gridOrder = [
    ['Jacket', 'Shirt', 'Earring'],
    ['Glasses', 'Pants', 'Watch'],
    ['Accessory', 'Shoes', 'Ring'],
  ];

  final Set<String> emphasizedItems = {'Shirt', 'Pants', 'Shoes'};

  @override
  void initState() {
    super.initState();
    selectedImages = widget.initialOutfit ?? generateRandomOutfit();
  }

  void regenerateOutfit() {
    setState(() {
      selectedImages = generateRandomOutfit();
    });
  }

  Widget buildCell(String type) {
    final image = selectedImages[type];
    final bool isEmphasized = emphasizedItems.contains(type);

    final double imageSize = isEmphasized ? 100 : 70;
    final double textSize = isEmphasized ? 16 : 13;
    final double containerHeight = isEmphasized ? 135 : 100;

    return SizedBox(
      height: containerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: textSize,
              fontFamily: 'Merienda One',
            ),
          ),
          const SizedBox(height: 6),
          Material(
            elevation: 2,
            shadowColor: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: imageSize,
                height: imageSize,
                color: Colors.white,
                child: image != null
                    ? Image.asset(image, fit: BoxFit.contain)
                    : Icon(Icons.image_not_supported, size: imageSize * 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6F8), // soft pink
      appBar: AppBar(
        title: const Text('OOTD'),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1.3),
                  2: FlexColumnWidth(1),
                },
                children: List.generate(3, (row) {
                  return TableRow(
                    children: List.generate(3, (col) {
                      final type = gridOrder[row][col];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: buildCell(type),
                      );
                    }),
                  );
                }),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: regenerateOutfit,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Random Outfit Again",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Merienda One',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
