import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/collection/widget/cart_collection.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Light background for contrast
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 40,
                    height: 40,
                  ),
                  const Text(
                    'Set',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Search and Create Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
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
                  const SizedBox(width: 12),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
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
                      backgroundColor: const Color(0xFFD3C0C0), // Soft greyish-brown
                    ),
                    CartCollection(
                      title: 'Relaxed',
                      image: 'assets/images/relaxed.png',
                      color: '0xFFD4C4A8',
                      backgroundColor: const Color(0xFFE1D1B6), // Light beige as requested
                    ),
                    CartCollection(
                      title: 'Office',
                      image: 'assets/images/office.png',
                      color: '0xFFA0826D',
                      backgroundColor: const Color(0xFFC8B8A8), // Warm taupe
                    ),
                    CartCollection(
                      title: 'Patty',
                      image: 'assets/images/party.png',
                      color: '0xFFB8A0A0',
                      backgroundColor: const Color(0xFFD8C2C2), // Soft pinkish-beige
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentRoute: '/set'),
    );
  }
}