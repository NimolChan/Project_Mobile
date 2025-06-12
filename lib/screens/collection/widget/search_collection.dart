import 'package:flutter/material.dart';

class SearchCreateFilter extends StatelessWidget {
  const SearchCreateFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Field
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      isDense: true,
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Create Button
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Filter Icon Button
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.grey, size: 20),
            onPressed: () {
              // Handle filter action
            },
          ),
        ),
      ],
    );
  }
}
