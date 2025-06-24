import 'package:flutter/material.dart';
import 'package:stylishcloset/utils/model.dart';
import 'dart:io';

class SetCollectionWidget extends StatefulWidget {
  final String collectionTitle;
  final List<CollectionItem> items;
  final bool isGridView;
  final int crossAxisCount;

  const SetCollectionWidget({
    Key? key,
    required this.collectionTitle,
    required this.items,
    this.isGridView = true,
    this.crossAxisCount = 2,
  }) : super(key: key);

  @override
  State<SetCollectionWidget> createState() => _SetCollectionWidgetState();
}

class _SetCollectionWidgetState extends State<SetCollectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Collection Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.collectionTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add favorite or bookmark functionality
                },
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ),
        
        // Collection Grid/List
        Expanded(
          child: widget.isGridView
              ? _buildGridView()
              : _buildListView(),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return _buildCollectionItemCard(widget.items[index]);
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildCollectionItemCard(widget.items[index], isListItem: true),
        );
      },
    );
  }

  Widget _buildCollectionItemCard(CollectionItem item, {bool isListItem = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: isListItem
          ? _buildListItemContent(item)
          : _buildGridItemContent(item),
    );
  }

  Widget _buildGridItemContent(CollectionItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: item.isFileImage
                ? Image.file(
                    File(item.imagePath),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 40,
                        ),
                      );
                    },
                  )
                : Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 40,
                        ),
                      );
                    },
                  ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildListItemContent(CollectionItem item) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
          child: Image.asset(
            item.imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                  size: 30,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}