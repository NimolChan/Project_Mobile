import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/home/item_detail.dart';

class ClothingCard extends StatelessWidget {
  final int id;
  final String name;
  final String color;
  final String size;
  final List<String> location;
  final List<String> tag;
  final String image;
  
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ClothingCard({
    super.key,
    required this.id,
    required this.name,
    required this.color,
    required this.size,
    required this.location,
    required this.tag,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(
              id: id,
              name: name,
              color: color,
              size: size,
              location: location,
              tags: tag,
              image: image,
              isFavorite: isFavorite,
              onFavoriteToggle: onFavoriteToggle,
              onItemUpdated: (updatedItem) {
                Navigator.pop(context, updatedItem);
              },
            ),
          ),
        ).then((updatedItem) {
          if (updatedItem != null) {
          }
        });
      },
      child: Card(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                image,
                height: 320,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 13,
                right: 13,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              )
          ],
        ),
      )
    );
  }
}