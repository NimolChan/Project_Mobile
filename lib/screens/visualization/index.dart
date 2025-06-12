import 'package:flutter/material.dart';
import 'package:stylishcloset/utils/constant.dart';
// import 'package:stylishcloset/utils/data.dart';
import 'package:stylishcloset/widgets/common/clothes_item.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class VisualizationScreen extends StatelessWidget {
  const VisualizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width:
                60, // Or your preferred size (60 looks good for circular avatars)
            height: 60, // Must match width to make a perfect circle
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover, // Changed to cover to fill the circle
              ),
            ),
          ),
        ),
        title: Text(
          'Visualization',
          style: AppFonts.meriendaDisplayLarge.copyWith(
            fontWeight: AppFonts.bold, // Override weight if needed
          ),
        ),
        actions: [
          // Optional: Add invisible widget to balance the logo space
          Container(width: 48), // Matches leading width
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Data Visualization Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/menBracelet.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/menWatch.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/menWatch2.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/ring.jpg",
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClothesItem(
                      width: 150,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/cardigan.jpg",
                    ),
                    ClothesItem(
                      width: 150,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/MenDressPants.jpg",
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/PrescriptionEyewear.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/Eyeglasses.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/MINIMALCHAINNECKLACE.jpg",
                    ),
                    ClothesItem(
                      width: 100,

                      id: 2,
                      name: "Classic White Tee",
                      color: "White",
                      size: "L",
                      location: ["Los Angeles", "Store 1"],
                      tag: ["casual", "summer"],
                      type: "T-Shirt",
                      price: 19.99,
                      image: "assets/images/Eyeglasses.jpg",
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClothesItem(
                  width: 100,

                  id: 2,
                  name: "Classic White Tee",
                  color: "White",
                  size: "L",
                  location: ["Los Angeles", "Store 1"],
                  tag: ["casual", "summer"],
                  type: "T-Shirt",
                  price: 19.99,
                  image: "assets/images/menClothe.jpg",
                ),
                ClothesItem(
                  width: 100,

                  id: 2,
                  name: "Classic White Tee",
                  color: "White",
                  size: "L",
                  location: ["Los Angeles", "Store 1"],
                  tag: ["casual", "summer"],
                  type: "T-Shirt",
                  price: 19.99,
                  image: "assets/images/cardigan.jpg",
                ),
                ClothesItem(
                  width: 100,

                  id: 2,
                  name: "Classic White Tee",
                  color: "White",
                  size: "L",
                  location: ["Los Angeles", "Store 1"],
                  tag: ["casual", "summer"],
                  type: "T-Shirt",
                  price: 19.99,
                  image: "assets/images/cardigan.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentRoute: '/visualize'),
    );
  }
}
