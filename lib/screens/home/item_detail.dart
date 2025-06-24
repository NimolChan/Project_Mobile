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
  final Function(Map<String, dynamic>) onItemUpdated;

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
    required this.onItemUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
          ),
        ],
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
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text("Name: $name", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Color: $color", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Tag: ${tags.join(', ')}", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Size: $size", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 10),
                  Text("Location: ${location.join(', ')}", style: TextStyle(color: Colors.black, fontSize: 16)),
                  
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => _showEditDialog(context),
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

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final colorController = TextEditingController(text: color);
    final sizeController = TextEditingController(text: size);
    final locationController = TextEditingController(text: location.join(', '));
    final tagsController = TextEditingController(text: tags.join(', '));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Item Info"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: colorController,
                  decoration: InputDecoration(labelText: "Color"),
                ),
                TextField(
                  controller: sizeController,
                  decoration: InputDecoration(labelText: "Size"),
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: "Location (comma separated)"),
                ),
                TextField(
                  controller: tagsController,
                  decoration: InputDecoration(labelText: "Tags (comma separated)"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final updatedItem = {
                  'id': id,
                  'name': nameController.text,
                  'color': colorController.text,
                  'size': sizeController.text,
                  'location': locationController.text.split(',').map((e) => e.trim()).toList(),
                  'tag': tagsController.text.split(',').map((e) => e.trim()).toList(),
                  'image': image,
                };
                
                onItemUpdated(updatedItem);
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}