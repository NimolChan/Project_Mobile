// import 'package:flutter/material.dart';

// class Favorites extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Favorites")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => Navigator.pop(context),
//           child: 
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/clothing_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems;
  const FavoritesPage({super.key, required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet!\nTap ♡ on items to add them.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return ClothingCard(
                  id: item['id'],
                  name: item['name'],
                  color: item['color'],
                  size: item['size'],
                  location: List<String>.from(item['location'] ?? []),
                  tag: List<String>.from(item['tag'] ?? []),
                  image: item['image'],
                  isFavorite: true, // Always true in favorites page
                  onFavoriteToggle: () {},
                );
              },
            ),
    );
  }
}