import 'package:flutter/material.dart';
import '../../utils/data.dart'; // for generateRandomOutfit
import 'Random_Oufit_Grid_Page.dart';

class RandomOutfitSection extends StatelessWidget {
  const RandomOutfitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RandomOutfitGridPage(
                  initialOutfit: generateRandomOutfit(),
                ),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          child: const Text(
            "Generate Random Outfit",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Merienda One',
            ),
          ),
        ),
      ),
    );
  }
}