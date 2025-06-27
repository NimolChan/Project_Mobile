import 'package:flutter/material.dart';
import '../../utils/model.dart';

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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.type,
              style: const TextStyle(
                fontFamily: 'Merienda One',
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
  final List<String> option;
 // Constructor to receive selected option, callback and list of options
  const RecommendationDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.option,
  });

  @override
  State<RecommendationDropdown> createState() => _RecommendationDropdownState();
}

class _RecommendationDropdownState extends State<RecommendationDropdown> {
  final GlobalKey _dropdownKey = GlobalKey(); // Key for dropdown to position overlay
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }
  // Function to toggle dropdown visibility
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
                elevation: 2,
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shrinkWrap: true,
                  children:
                      widget.option.map((option) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected = option;
                            });
                            widget.onChanged(option);
                            _toggleDropdown();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Merienda One',
                              ),
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
    return CompositedTransformTarget(
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
                widget.selected,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

/// SAMPLE USAGE OF RecommendationDropdown WIDGET
class SampleUsage extends StatefulWidget {
  const SampleUsage({Key? key}) : super(key: key);

  @override
  State<SampleUsage> createState() => _SampleUsageState();
}

class _SampleUsageState extends State<SampleUsage> {
  String selectedTag = 'All';
  String selectedSubTag = 'all';

  String displayTag(String tag) {
    if (tag.isEmpty) return tag;
    return tag[0].toUpperCase() + tag.substring(1);
  }

  List<String> getAllTags() {
    return [
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecommendationDropdown(
          selected: displayTag(selectedTag),
          onChanged: (value) {
            setState(() {
              selectedTag = value.toLowerCase();
              selectedSubTag = 'all'; // Reset sub-tag when main tag changes
            });
          },
          option: getAllTags().map(displayTag).toList(),
        ),
      ],
    );
  }
}
