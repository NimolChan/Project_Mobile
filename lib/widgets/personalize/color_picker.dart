import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(Color?) onColorSelected;

  const ColorPicker({super.key, required this.onColorSelected});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color?> colors = [
    null,
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink.shade200,
    Colors.deepPurple,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color Picker",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Merienda One',
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: const [
            Text(
              "Sorted",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Merienda One',
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.sort, size: 14, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              final color = colors[index];
              final colorAll = colors;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    // check show all
                    if (colorAll.length == colors.length) {
                      selectedIndex = index;
                    } else {
                      selectedIndex = index;
                    }
                  });
                  widget.onColorSelected(color); // Send null if "All"
                },
                child: Container(
                  width: 32,
                  height: 32,
                  padding:
                      isSelected ? const EdgeInsets.all(2.5) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        isSelected
                            ? Border.all(color: Colors.deepPurple, width: 2)
                            : null,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:
                          color == null
                              ? const LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.orange,
                                  Colors.yellow,
                                  Colors.green,
                                  Colors.blue,
                                  Colors.purple,
                                ],
                              )
                              : null,
                      color: color,
                      border: Border.all(color: Colors.black12),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
