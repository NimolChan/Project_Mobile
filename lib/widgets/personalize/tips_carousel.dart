import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class TipsCarousel extends StatelessWidget {
  const TipsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tips.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final tip = tips[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Tip background image
                      Image.asset(
                        tip['image']!,
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                      ),

                      // Semi-transparent dark overlay for better text visibility
                      Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),

                      // Centered Tip Title Text
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          tip['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Merienda One',
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          
                        ),
                      ),
                    ),
                   ),
                    ],
                  ),
              );
            },
          ),
        ),
      ],
    );
  }
}
