import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/collection/widget/cart_collection.dart';
import 'package:stylishcloset/screens/collection/set_create_page.dart' as set_create;
import 'package:stylishcloset/widgets/common/navigation.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light background for contrast
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        automaticallyImplyLeading: false, // no default back button
        // Custom layout: logo left, title centered
        title: Stack(
          alignment: Alignment.center,
          children: [
            /// Centered title
            const Text(
              'Collection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merienda One',
                color: Colors.black,
              ),
            ),

            /// Left logo
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/logo.png',
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Search and Create Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const set_create.SetCreatePage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F2F5),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 16),
                            Icon(Icons.search, color: Colors.grey, size: 22),
                            SizedBox(width: 10),
                            Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const set_create.SetCreatePage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0x1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.black87,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Category Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: ListView(
                  children: [
                    CartCollection(
                      title: 'Wedding',
                      image: 'assets/images/wedding.png',
                      color: '0xFF847B7B',
                      backgroundColor: const Color(
                        0xFFD3C0C0,
                      ), // Soft greyish-brown
                    ),
                    CartCollection(
                      title: 'Relax',
                      image: 'assets/images/relaxed.png',
                      color: '0xFFD4C4A8',
                      backgroundColor: const Color(
                        0xFFE1D1B6,
                      ), // Light beige as requested
                    ),
                    CartCollection(
                      title: 'Office',
                      image: 'assets/images/office.png',
                      color: '0xFFA0826D',
                      backgroundColor: const Color(0xFFC8B8A8), // Warm taupe
                    ),
                    CartCollection(
                      title: 'Party',
                      image: 'assets/images/party.png',
                      color: '0xFFB8A0A0',
                      backgroundColor: const Color(
                        0xFFD8C2C2,
                      ), // Soft pinkish-beige
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/collection'),
    );
  }
}
