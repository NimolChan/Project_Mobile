import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final int id;
  final String name;
  final String color;
  final String size;
  final List<String> location;
  final List<String> tags;
  final String image;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ItemDetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.color,
    required this.size,
    required this.location,
    required this.tags,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       isFavorite ? Icons.favorite : Icons.favorite_border,
        //       color: isFavorite ? Colors.red : Colors.white,
        //     ),
        //     onPressed: onFavoriteToggle,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 70, right: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  )
                ]
              ),
              child: Center(
                child: Image.asset(
                  image,
                  width: 300,
                  height: 450,
                  fit: BoxFit.cover,
                )
              ),
            ),
           
            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text("Name: $name", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Color: $Color", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text( "Tag: ${tags.join(', ')}", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Size: $size", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Location: ${location.join(', ')}", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  // Add to Cart Button
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                            "Edit Info",
                            style: TextStyle(color: Colors.white , fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}