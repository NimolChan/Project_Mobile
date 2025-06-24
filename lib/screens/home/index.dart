import 'dart:io';
import 'package:flutter/material.dart';

import 'package:stylishcloset/widgets/common/clothing_card.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';
import 'favoriteItemPage.dart';
import 'package:image_picker/image_picker.dart';
import 'add_item.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'item_detail.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenAppState();
}

class _HomeScreenAppState extends State<HomeScreen> {
  bool showFilter = false;
  List<String> filterTags = ['Shirt', 'Pants', 'Shoes', 'Skirt', 'Dress', 'Necklace', 'Bracelet', 'Ring', 'Watch', 'Bag'];
  List<String> filterColors = ['White', 'Black', 'Grey', 'Yellow', 'Pink', 'Purple', 'Blue', 'Red', 'Green', 'Brown'];

  List<Map<String, dynamic>> favoriteItems = [];
  List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'name': "Shirt",
      'color': "Grey",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Shirt"],
      'image': 'assets/images/shirt1.png',
    },
    {
      'id': 2,
      'name': "Skirt",
      'color': "Blue",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Skirt"],
      'image': 'assets/images/skirt1.jpg',
    },
    {
      'id': 3,
      'name': "Shirt",
      'color': "White",
      'size': "S",
      'location': ["Big Closet"],
      'tag': ["Shirt"],
      'image': 'assets/images/c1.png',
    },
      {
      'id': 4,
      'name': "Floral Dress",
      'color': "Red",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Dress"],
      'image': 'assets/images/c2.png',
    },
    {
      'id': 5,
      'name': "Shirt",
      'color': "Blue",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Shirt"],
      'image': 'assets/images/c3.png',
    },

    {
      'id': 6,
      'name': "Shirt",
      'color': "Black",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Skirt"],
      'image': 'assets/images/shirt1.png',
    },

    {
      'id': 7,
      'name': "Cardigan",
      'color': "Blue",
      'size': "M",
      'location': ["Big Closet"],
      'tag': ["Shirt"],
      'image': 'assets/images/cardigan.jpg',
    },

  ];

  String? selectedTag = null;
  String? selectedColor = null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadItems();
      await _loadFavorites();
    });
  }

  // Favorite methods
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites', jsonEncode(favoriteItems));
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favorites');
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      setState(() {
        favoriteItems = decoded.map((item) => item as Map<String, dynamic>).toList();
      });
    }
  }

  void toggleFavorite(int id, String name, String image) async {
    setState(() {
      final existingIndex = favoriteItems.indexWhere((item) => item['id'] == id);
      if (existingIndex >= 0) {
        favoriteItems.removeAt(existingIndex);
      } else {
        final item = items.firstWhere((item) => item['id'] == id);
        favoriteItems.add({
          'id': item['id'],
          'name': item['name'],
          'image': item['image'],
          'color': item['color'],
          'size': item['size'],
          'location': List<String>.from(item['location']),
          'tag': List<String>.from(item['tag']),
        });
      }
    });
    await _saveFavorites();
  }

  // Item CRUD methods
  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('clothing_items', jsonEncode(items));
  }

  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('clothing_items');
    if (data != null) {
      setState(() {
        items = List<Map<String, dynamic>>.from(jsonDecode(data));
      });
    }
  }

  Future<void> _addNewItem(Map<String, dynamic> newItem) async {
    try {
      if (newItem['image'].startsWith('assets/')) {
        setState(() {
          items.add(newItem);
        });
        await _saveItems();
        return;
      }
      
      final File imageFile = File(newItem['image']);
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await imageFile.copy('${appDir.path}/$fileName');
      
      setState(() {
        items.add({
          ...newItem,
          'image': savedImage.path,
        });
      });
      await _saveItems();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save item: ${e.toString()}')),
      );
    }
  }

  Future<void> _updateItem(Map<String, dynamic> updatedItem) async {
    try {
      setState(() {
        final index = items.indexWhere((item) => item['id'] == updatedItem['id']);
        if (index != -1) {
          items[index] = updatedItem;
        }
      });
      await _saveItems();
      
      // Update favorites if this item is favorited
      final favIndex = favoriteItems.indexWhere((item) => item['id'] == updatedItem['id']);
      if (favIndex != -1) {
        setState(() {
          favoriteItems[favIndex] = updatedItem;
        });
        await _saveFavorites();
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update item: ${e.toString()}')),
      );
    }
  }

  List<Map<String, dynamic>> get filteredItems {
    return items.where((item) {
      final tagMatch = selectedTag == null || 
          (item['tag'] as List).contains(selectedTag);
      final colorMatch = selectedColor == null || 
          (item['color'] as String).toLowerCase() == selectedColor!.toLowerCase();
      return tagMatch && colorMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/logo.png", 
            width: 40, 
            height: 40
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => AddItemPage(onItemAdded: _addNewItem)
                ),
              );
            },
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(favoriteItems: favoriteItems),
                ),
              );
            },
            icon: Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            icon: Icon(
              Icons.tune_outlined,
              color: showFilter ? Colors.deepPurpleAccent : Colors.black,
            ),
            onPressed: () {
              setState(() {
                showFilter = !showFilter;
              });
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showFilter) _buildFilterSection(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                childAspectRatio: 0.75,
                children: filteredItems.map((item) => GestureDetector(
                  onTap: () async {
                    final updatedItem = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                          id: item['id'],
                          name: item['name'],
                          color: item['color'],
                          size: item['size'],
                          location: item['location'],
                          tags: item['tag'],
                          image: item['image'],
                          isFavorite: favoriteItems.any((fav) => fav['id'] == item['id']),
                          onFavoriteToggle: () => toggleFavorite(
                            item['id'],
                            item['name'],
                            item['image'],
                          ),
                          onItemUpdated: _updateItem,
                        ),
                      ),
                    );
                    
                    if (updatedItem != null) {
                      await _updateItem(updatedItem);
                    }
                  },
                  child: ClothingCard(
                    id: item['id'],
                    name: item['name'],
                    color: item['color'],
                    size: item['size'],
                    location: item['location'],
                    tag: item['tag'],
                    image: item['image'],
                    isFavorite: favoriteItems.any((fav) => fav['id'] == item['id']),
                    onFavoriteToggle: () => toggleFavorite(
                      item['id'],
                      item['name'],
                      item['image'],
                    ),
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/home'),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      width: 430,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.5,
          ),
        ],
      ), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter By",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTag = null;
                    selectedColor = null;
                  });
                },
                child: Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Clothes: ", style: TextStyle(color: Colors.black, fontSize: 16)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedTag,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: SizedBox(),
                      onChanged: (String? newTag) {
                        setState(() {
                          selectedTag = newTag;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text('All'),
                        ),
                        ...filterTags.map((tag) {
                          return DropdownMenuItem<String>(
                            value: tag,
                            child: Text(tag),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  Text("Colors: ", style: TextStyle(color: Colors.black, fontSize: 16)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedColor,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: SizedBox(),
                      onChanged: (String? newColor) {
                        setState(() {
                          selectedColor = newColor;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text('All'),
                        ),
                        ...filterColors.map((color) {
                          return DropdownMenuItem<String>(
                            value: color,
                            child: Text(color),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}