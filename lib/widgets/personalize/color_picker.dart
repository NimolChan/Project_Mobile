import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Color? selectedColor;
  final Function(Color?) onColorSelected;

  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> colorOptions = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.lightBlue,
    Colors.purple,
    Colors.orange,
    Colors.pinkAccent,
    Colors.deepPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sorted", style: TextStyle(fontSize: 14)),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: colorOptions.map((color) {
              final isSelected = widget.selectedColor == color;
              return GestureDetector(
                onTap: () {
                  widget.onColorSelected(color);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 14,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => widget.onColorSelected(null), // Reset filter
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
          ),
          child: const Text("All Colors"),
        ),
      ],
    );
  }
}
