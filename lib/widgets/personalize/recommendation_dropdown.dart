import 'package:flutter/material.dart';
import '../../models/clothing_item.dart';


/// CLOTHING ITEM CARD WIDGET
class ClothingItemCard extends StatelessWidget {
  final ClothingItem item;
  const ClothingItemCard({super.key, required this.item});

 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.category,
              style: const TextStyle(
                fontFamily: 'Merienda One', // 👈 use custom font
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// RECOMMENDATION DROPDOWN WITH CUSTOM OVERLAY
class RecommendationDropdown extends StatefulWidget {
  final String selected;
  final void Function(String) onChanged; 

    const RecommendationDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });
  @override
  State<RecommendationDropdown> createState() => _RecommendationDropdownState();
}

class _RecommendationDropdownState extends State<RecommendationDropdown> {
  final GlobalKey _dropdownKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  String selected = "All";

  final List<String> options = [
    "All",
    "Trendy",
    "Classy",
    "Formal",
    "Vintage",
    "Old Money",
    "Street wear",
    "Feminine",
    "Winter",
    "Summer",
    "Sporty",
    "Acubi",
  ];

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

OverlayEntry _createOverlayEntry() {
  RenderBox renderBox =
      _dropdownKey.currentContext!.findRenderObject() as RenderBox;
  final size = renderBox.size;
  final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 4,
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 4),
              child: Material(
                elevation: 0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  children:
                      options.map((option) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected = option;            // <-- Update local UI
                            });
                            widget.onChanged(option);       // Notify parent
                            _toggleDropdown();
                          },

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(fontSize: 16, fontFamily: 'Merienda One'),

                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _toggleDropdown,
            child: Container(
              key: _dropdownKey,
              width: 140,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selected,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 20),
      ],
    );
  }
}
