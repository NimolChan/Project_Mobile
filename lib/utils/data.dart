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
    "image": "assets/images/OF1.png"
  },
  {
    "id": 2,
    "name": "Formal Pants",
    "color": "White",
    "colorTag": Colors.black,
    "size": "L",
    "location": ["Los Angeles", "Store 1"],
    "tag": ["Classy", "Formal"],
    "type": "Pants",
    "price": 19.99,
    "image": "assets/images/OF4.png"
  },
  {
    "id": 3,
    "name": "Denim Jeans",
    "color": "Dark Blue",
    "colorTag": Colors.black,
    "size": "32",
    "location": ["Chicago", "Store 3"],
    "tag": ["Formal", "Classy"],
    "type": "Shirt",
    "price": 59.50,
    "image": "assets/images/OF3.png"
  },
  {
    "id": 4,
    "name": "Athletic Shorts",
    "color": "Black",
    "colorTag": Colors.white,
    "size": "M",
    "location": ["Miami", "Warehouse B"],
    "tag": ["Formal"],
    "type": "Shirt",
    "price": 29.99,
    "image": "assets/images/OF2.png",
  },
  {
    "id": 5,
    "name": "Sneaker Casual",
    "color": "Gray",
    "colorTag": Colors.blue,
    "size": "L",
    "location": ["Seattle", "Store 2"],
    "tag": ["Trendy", "Formal"],
    "type": "Shoes",
    "price": 49.99,
    "image": "assets/images/menSneaker1.jpg"
  },
  {
    "id": 6,
    "name": "Summer Dress",
    "color": "Floral",
    "colorTag": Colors.pink,
    "size": "S",
    "location": ["San Diego", "Store 4"],
    "tag": ["Trendy", "Formal"],
    "type": "Watch",
    "price": 69.95,
    "image": "assets/images/OF7.png"
  },
  {
    "id": 7,
    "name": "Eyeglasses Trendy",
    "color": "Green",
    "colorTag": Colors.green,
    "size": "M",
    "location": ["Austin", "Warehouse A"],
    "tag": ["Trendy", "Formal"],
    "type": "Glasses",
    "price": 34.99,
    "image": "assets/images/Eyeglasses.jpg"
  },
  {
    "id": 8,
    "name": "Minimalist Earrings",
    "color": "Brown",
    "colorTag": Colors.brown,
    "size": "L",
    "location": ["Boston", "Store 5"],
    "tag": ["Trendy", "Formal"],
    "type": "Earring",
    "price": 129.99,
    "image": "assets/images/OF10.png"
  },
  {
    "id": 9,
    "name": "Cargo Pants",
    "color": "Khaki",
    "colorTag": Colors.yellow,
    "size": "34",
    "location": ["Denver", "Store 3"],
    "tag": ["Trendy", "Formal"],
    "type": "Ring",
    "price": 44.95,
    "image": "assets/images/ring2.jpg"
  },
  {
    "id": 10,
    "name": "Blouse Elegant",
    "color": "Cream",
    "colorTag": Colors.white,
    "size": "M",
    "location": ["San Francisco", "Store 6"],
    "tag": ["formal", "blouse"],
    "type": "Jacket",
    "price": 79.99,
    "image": "assets/images/RL3.png"
  },
  {
    "id": 11,
    "name": "Sneaker Casual",
    "color": "Black",
    "size": "L",
    "location": ["Phoenix", "Store 7"],
    "tag": ["graphic", "Casual"],
    "type": "Shoes",
    "price": 24.99,
    "image": "assets/images/menSneaker.jpg"
  },
  {
    "id": 12,
    "name": "Bags",
    "color": "Dark Gray",
    "colorTag": Colors.black,
    "size": "S",
    "location": ["Portland", "Warehouse C"],
    "tag": ["Trendy", "stretch"],
    "type": "Accessory",
    "price": 39.99,
    "image": "assets/images/OF13.png"
  },
  {
    "id": 13,
    "name": "Fleece Vest",
    "color": "Navy",
    "size": "M",
    "location": ["Las Vegas", "Store 8"],
    "tag": ["fleece", "layer"],
    "type": "Vest",
    "price": 54.99,
    "image": "assets/images/ring.jpg"
  },
  {
    "id": 14,
    "name": "Formal Trousers",
    "color": "Charcoal",
    "size": "36",
    "location": ["Atlanta", "Warehouse B"],
    "tag": ["office", "formal"],
    "type": "Trousers",
    "price": 64.99,
    "image": "assets/images/ring2.jpg"
  },
  {
    "id": 15,
    "name": "Raincoat Light",
    "color": "Yellow",
    "size": "L",
    "location": ["Houston", "Store 9"],
    "tag": ["rain", "spring"],
    "type": "Coat",
    "price": 74.95,
    "image": "assets/images/minimalchainnecklace.jpg"
  },
  {
    "id": 16,
    "name": "Striped Sweater",
    "color": "Red/White",
    "size": "M",
    "location": ["Orlando", "Store 10"],
    "tag": ["knit", "casual"],
    "type": "Sweater",
    "price": 44.99,
    "image": "assets/images/prescriptioneyewear.jpg"
  },
  {
    "id": 17,
    "name": "Linen Shirt",
    "color": "Beige",
    "size": "L",
    "location": ["Philadelphia", "Store 11"],
    "tag": ["linen", "summer"],
    "type": "Shirt",
    "price": 52.99,
    "image": "assets/images/mentshirt1.jpg"
  },
  {
    "id": 18,
    "name": "Puffer Jacket",
    "color": "Olive",
    "size": "XL",
    "location": ["Detroit", "Warehouse D"],
    "tag": ["winter", "puffer"],
    "type": "Jacket",
    "price": 99.95,
    "image": "assets/images/ring2.jpg"
  },
  {
    "id": 19,
    "name": "Running Tights",
    "color": "Black",
    "size": "S",
    "location": ["Charlotte", "Store 12"],
    "tag": ["run", "sport"],
    "type": "Tights",
    "price": 34.50,
    "image": "assets/images/ring.jpg"
  },
  {
    "id": 20,
    "name": "Wool Coat",
    "color": "Camel",
    "size": "M",
    "location": ["Columbus", "Warehouse E"],
    "tag": ["wool", "formal"],
    "type": "Coat",
    "price": 149.99,
    "image": "assets/images/ring2.jpg"
  },
  {
    "id": 21,
    "name": "Knit Sweater",
    "color": "Cream",
    "size": "L",
    "location": "Winter storage box",
    "tag": ["knit", "cozy"],
    "type": "Sweater",
    "price": 65.99,
    "image": "assets/images/menBag1.jpg"
  },
  {
    "id": 22,
    "name": "Swim Trunks",
    "color": "Navy Blue",
    "size": "M",
    "location": "Beach bag",
    "tag": ["swim", "summer"],
    "type": "Shorts",
    "price": 35.50,
    "image": "assets/images/menEarrings2.jpg"
  },
  {
    "id": 23,
    "name": "Flannel Shirt",
    "color": "Red/Black Check",
    "size": "XL",
    "location": "Cabin wardrobe",
    "tag": ["flannel", "casual"],
    "type": "Shirt",
    "price": 42.75,
    "image": "assets/images/menSneaker1.jpg"
  },
  {
    "id": 24,
    "name": "Silk Scarf",
    "color": "Emerald Green",
    "size": "One Size",
    "location": "Accessory drawer",
    "tag": ["accessory", "formal"],
    "type": "Scarf",
    "price": 28.99,
    "image": "assets/images/menscarf1.jpg"
  },
  {
    "id": 25,
    "name": "Baseball Cap",
    "color": "Black",
    "size": "Adjustable",
    "location": "Car glove compartment",
    "tag": ["cap", "casual"],
    "type": "Hat",
    "price": 22.50,
    "image": "assets/images/menBelt1.jpg"
  }
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
