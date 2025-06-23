import 'package:flutter/material.dart';
// import '../common/clothing_item.dart';
import '../utils/model.dart';

final List<Map<String, dynamic>> clothes = [
  {
    "id": 1,
    "name": "Jacket Bloom",
    "color": "Blue",
    "colorTag": Colors.blue,
    "size": "M",
    "location": ["New York", "Warehouse A"],
    "tag": ['Trendy'],
    "type": "Shirt",
    "price": 89.99,
    // "image": "https://example.com/images/jacket_bloom.jpg"
    "image": "assets/images/c1.png",
  },
  {
    "id": 2,
    "name": "Classic White Tee",
    "color": "White",
    "colorTag": Colors.white,
    "size": "L",
    "location": ["Los Angeles", "Store 1"],
    "tag": ["Classy", "Formal"],
    "type": "Pants",
    "price": 19.99,
    // "image": "https://example.com/images/white_tee.jpg"
    "image": "assets/images/c2.png",
  },
  {
    "id": 3,
    "name": "Denim Jeans",
    "color": "Dark Blue",
    "colorTag": Colors.blue,
    "size": "32",
    "location": ["Chicago", "Store 3"],
    "tag": ["Formal", "Classy"],
    "type": "Jacket",
    "price": 59.50,
    // "image": "https://example.com/images/denim_jeans.jpg"
    "image": "assets/images/c4.png",
  },
  {
    "id": 4,
    "name": "Athletic Shorts",
    "color": "Black",
    "colorTag": Colors.black,
    "size": "M",
    "location": ["Miami", "Warehouse B"],
    "tag": ["Formal"],
    "type": "Shoes",
    "price": 29.99,
    // "image": "https://example.com/images/athletic_shorts.jpg"
    "image": "assets/images/c3.png",
  },
  {
    "id": 5,
    "name": "Hoodie Comfort",
    "color": "Gray",
    "colorTag": Colors.grey,
    "size": "L",
    "location": ["Seattle", "Store 2"],
    "tag": ["Trendy", "Formal"],
    "type": "Glasses",
    "price": 49.99,
    // "image": "https://example.com/images/hoodie_comfort.jpg"
    "image": "assets/images/c3.png",
  },
  {
    "id": 6,
    "name": "Summer Dress",
    "color": "Floral",
    "colorTag": Colors.pink,
    "size": "S",
    "location": ["San Diego", "Store 4"],
    "tag": ["Trendy", "Formal"],
    "type": "Ring",
    "price": 69.95,
    // "image": "https://example.com/images/summer_dress.jpg"
    "image": "assets/images/c3.png",
  },
  {
    "id": 7,
    "name": "Polo Shirt",
    "color": "Green",
    "colorTag": Colors.green,
    "size": "M",
    "location": ["Austin", "Warehouse A"],
    "tag": ["Trendy", "Formal"],
    "type": "Watch",
    "price": 34.99,
    // "image": "https://example.com/images/polo_shirt.jpg"
    "image": "assets/images/c3.png",
  },
  {
    "id": 8,
    "name": "Leather Jacket",
    "color": "Brown",
    "colorTag": Colors.brown,
    "size": "L",
    "location": ["Boston", "Store 5"],
    "tag": ["Trendy", "Formal"],
    "type": "Earring",
    "price": 129.99,
    // "image": "https://example.com/images/leather_jacket.jpg"
    "image": "assets/images/c3.png",
  },
  {
    "id": 9,
    "name": "Cargo Pants",
    "color": "Khaki",
    "colorTag": Colors.yellow,
    "size": "34",
    "location": ["Denver", "Store 3"],
    "tag": ["Trendy", "Formal"],
    "type": "Accessory",
    "price": 44.95,
    // "image": "https://example.com/images/cargo_pants.jpg"
    "image": "assets/images/c3.png",
  },
  // {
  //   "id": 10,
  //   "name": "Silk Blouse",
  //   "color": "Cream",
  //   "colorTag": Colors.yellow,
  //   "size": "M",
  //   "location": ["San Francisco", "Store 6"],
  //   "tag": ["formal", "blouse"],
  //   "type": "Blouse",
  //   "price": 79.99,
  //   "image": "https://example.com/images/silk_blouse.jpg"
  // },
  // {
  //   "id": 11,
  //   "name": "Graphic Tee",
  //   "color": "Black",
  //   "colorTag": Colors.black,
  //   "size": "L",
  //   "location": ["Phoenix", "Store 7"],
  //   "tag": ["graphic", "casual"],
  //   "type": "T-Shirt",
  //   "price": 24.99,
  //   "image": "https://example.com/images/graphic_tee.jpg"
  // },
  // {
  //   "id": 12,
  //   "name": "Yoga Pants",
  //   "color": "Dark Gray",
  //   "colorTag": Colors.grey,
  //   "size": "S",
  //   "location": ["Portland", "Warehouse C"],
  //   "tag": ["yoga", "stretch"],
  //   "type": "Pants",
  //   "price": 39.99,
  //   "image": "https://example.com/images/yoga_pants.jpg"
  // },
  // {
  //   "id": 13,
  //   "name": "Fleece Vest",
  //   "color": "Navy",
  //   "colorTag": Colors.blue,
  //   "size": "M",
  //   "location": ["Las Vegas", "Store 8"],
  //   "tag": ["fleece", "layer"],
  //   "type": "Vest",
  //   "price": 54.99,
  //   "image": "https://example.com/images/fleece_vest.jpg"
  // },
  // {
  //   "id": 14,
  //   "name": "Formal Trousers",
  //   "color": "Charcoal",
  //   "colorTag": Colors.black,
  //   "size": "36",
  //   "location": ["Atlanta", "Warehouse B"],
  //   "tag": ["office", "formal"],
  //   "type": "Trousers",
  //   "price": 64.99,
  //   "image": "https://example.com/images/formal_trousers.jpg"
  // },
  // {
  //   "id": 15,
  //   "name": "Raincoat Light",
  //   "color": "Yellow",
  //   "colorTag": Colors.yellow,
  //   "size": "L",
  //   "location": ["Houston", "Store 9"],
  //   "tag": ["rain", "spring"],
  //   "type": "Coat",
  //   "price": 74.95,
  //   "image": "https://example.com/images/raincoat_light.jpg"
  // },
  // {
  //   "id": 16,
  //   "name": "Striped Sweater",
  //   "color": "Red/White",
  //   "colorTag": Colors.red,
  //   "size": "M",
  //   "location": ["Orlando", "Store 10"],
  //   "tag": ["knit", "casual"],
  //   "type": "Sweater",
  //   "price": 44.99,
  //   "image": "https://example.com/images/striped_sweater.jpg"
  // },
  // {
  //   "id": 17,
  //   "name": "Linen Shirt",
  //   "color": "Beige",
  //   "colorTag": Colors.white,
  //   "size": "L",
  //   "location": ["Philadelphia", "Store 11"],
  //   "tag": ["linen", "summer"],
  //   "type": "Shirt",
  //   "price": 52.99,
  //   "image": "https://example.com/images/linen_shirt.jpg"
  // },
  // {
  //   "id": 18,
  //   "name": "Puffer Jacket",
  //   "color": "Olive",
  //   "colorTag": Colors.green,
  //   "size": "XL",
  //   "location": ["Detroit", "Warehouse D"],
  //   "tag": ["winter", "puffer"],
  //   "type": "Jacket",
  //   "price": 99.95,
  //   "image": "https://example.com/images/puffer_jacket.jpg"
  // },
  // {
  //   "id": 19,
  //   "name": "Running Tights",
  //   "color": "Black",
  //   "colorTag": Colors.black,
  //   "size": "S",
  //   "location": ["Charlotte", "Store 12"],
  //   "tag": ["run", "sport"],
  //   "type": "Tights",
  //   "price": 34.50,
  //   "image": "https://example.com/images/running_tights.jpg"
  // },
  // {
  //   "id": 20,
  //   "name": "Wool Coat",
  //   "color": "Camel",
  //   "colorTag": Colors.brown,
  //   "size": "M",
  //   "location": ["Columbus", "Warehouse E"],
  //   "tag": ["wool", "formal"],
  //   "type": "Coat",
  //   "price": 149.99,
  //   "image": "https://example.com/images/wool_coat.jpg"
  // }
];

final tips = [
  {
    "title": "How to sort out your wardrobe",
    "image": "assets/images/tip1.png",
    "description":
        'Start by removing everything from your closet. Group items by type and keep only what you truly wear. Donate or reuse the rest.',
  },
  {
    "title": "Assemble the perfect capsule wardrobe",
    "image": "assets/images/tip2.png",
    "description":
        'A capsule wardrobe is a small collection of versatile pieces that can be mixed and matched. Choose neutral colors and classic styles to maximize outfit combinations.',
  },
  {
    "title": "Save money by reusing clothes smartly",
    "image": "assets/images/tip3.png",
    "description":
        'Get creative with your outfits! Layer, accessorize, and combine pieces in new ways to refresh your look without spending money.',
  },
  {
    "title": "Save money by reusing clothes smartly",
    "image": "assets/images/tip2.png",
    "description":
        'Invest in quality basics that can be worn in multiple seasons. Look for timeless pieces that won’t go out of style quickly.',
  },
];

final List<ClothingItem> clothingItems =
    clothes
        .where(
          (item) =>
              item.containsKey('id') &&
              item.containsKey('name') &&
              item.containsKey('color') &&
              item.containsKey('colorTag') && // <-- Add this check!
              item.containsKey('size') &&
              item.containsKey('location') &&
              item.containsKey('tag') &&
              item.containsKey('type') &&
              item.containsKey('price') &&
              item.containsKey('image'),
        )
        .map((item) => ClothingItem.fromMap(item))
        .toList();

List<String> outfitTypes = [
  'Shirt',
  'Pants',
  'Jacket',
  'Shoes',
  'Glasses',
  'Ring',
  'Watch',
  'Earring',
  'Accessory',
];

Map<String, String> generateRandomOutfit() {
  Map<String, String> newOutfit = {};
  for (String type in outfitTypes) {
    final items = clothingItems.where((item) => item.type == type).toList();
    if (items.isNotEmpty) {
      items.shuffle();
      newOutfit[type] = items.first.image;
    }
  }
  return newOutfit;
}
