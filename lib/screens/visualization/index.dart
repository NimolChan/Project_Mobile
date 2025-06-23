import 'package:flutter/material.dart';
import 'package:stylishcloset/utils/constant.dart';
import 'package:stylishcloset/utils/data.dart';
import 'package:stylishcloset/widgets/common/clothes_item.dart';
// import 'package:stylishcloset/utils/data.dart';
// import 'package:stylishcloset/widgets/common/clothing_item.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({Key? key}) : super(key: key);

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  int selectedIndex = 0; // Default to clothes[0]

  void _showClothesPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Clothes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemCount: clothes.length,
                    itemBuilder: (context, index) {
                      final item = clothes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: ClothesItem(item: item, width: 70),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            ),
          ),
        ),
        title: Text(
          'Visualization',
          style: AppFonts.meriendaDisplayLarge.copyWith(
            fontWeight: AppFonts.bold,
          ),
        ),
        actions: [Container(width: 48)],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[23], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[12], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[13], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[21], width: 100),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _showClothesPopup(context),
                        child: SizedBox(
                          width: 150,
                          height: 200,
                          child: ClothesItem(item: clothes[selectedIndex], width: 150),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 200,
                        child: ClothesItem(item: clothes[1], width: 150),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[6], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[7], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[8], width: 100),
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClothesItem(item: clothes[9], width: 100),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClothesItem(item: clothes[20], width: 100),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClothesItem(item: clothes[24], width: 100),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClothesItem(item: clothes[22], width: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentRoute: '/visualize'),
    );
  }
}
