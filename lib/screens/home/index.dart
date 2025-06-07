import 'package:flutter/material.dart';
import 'package:stylishcloset/widgets/common/clothing_card.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
    State<HomeScreen> createState() => _HomeScreenAppState();
}
  
class _HomeScreenAppState extends State<HomeScreen> {
  bool showFilter = false;
  List<String> filterTags = ['Shirt', 'Pants', 'Shoes', 'Skirt', 'Dress', 'Necklace', 'Bracelet', 'Ring', 'Watch', 'Bag'];
  String? selectedTag = 'Shirt';
  List<String> filterColors = ['White', 'Black', 'Grey', 'Yellow', 'Pink', 'Purple', 'Blue', 'Red', 'Green', 'Brown'];
  String? selectedColor = 'White';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){

          }, 
          icon: Image.asset(
            "assets/images/logo.png", 
            width: 40, 
            height: 40
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            icon: Icon(Icons.tune_outlined),
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
            color: Colors.grey.shade300, // Bottom border color
            height: 1.0, // Border thickness
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showFilter)
              Container(
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
                    Text(
                      "Filter By",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 0, width: double.infinity),
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
                                underline: SizedBox(), // Remove the default underline
                                onChanged: (String? newTag) {
                                  setState(() {
                                    selectedTag = newTag;
                                  });
                                },
                                items: filterTags.map((tag) {
                                  return DropdownMenuItem<String>(
                                    value: tag,
                                    child: Text(tag),
                                  );
                                }).toList(),
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
                                underline: SizedBox(), // Remove the default underline
                                onChanged: (String? newColor) {
                                  setState(() {
                                    selectedColor = newColor;
                                  });
                                },
                                items: filterColors.map((chossencolor) {
                                  return DropdownMenuItem<String>(
                                    value: chossencolor,
                                    child: Text(chossencolor),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                childAspectRatio: 0.75, // Adjust for your card's width/height ratio
                children: const[
                  ClothingCard(
                    id: 1, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                  ClothingCard(
                    id: 2, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                  ClothingCard(
                    id: 1, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                  ClothingCard(
                    id: 1, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                  ClothingCard(
                    id: 1, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                  ClothingCard(
                    id: 1, 
                    name: "Shirt", 
                    tag: ["Shirt"], 
                    image: 'assets/images/shirt1.png'
                  ),
                ],
              ),
              ),
            ],
          ),
        ),

      bottomNavigationBar: 
        const CustomBottomNav(),
    );
  }
  }
