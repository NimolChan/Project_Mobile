import 'package:flutter/material.dart';

class ClothingCard extends StatefulWidget {
  final int id;
  final String name;
  final List<String> tag;
  final String image;
  
  const ClothingCard({
    super.key,
    required this.id,
    required this.name,
    required this.tag,
    required this.image,
  });


  @override
  State<ClothingCard> createState() => _ClothingCardState();
}
class _ClothingCardState extends State<ClothingCard> {
  bool isFavorited = false; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  widget.image,
                  height: 320,
                  width: 250,
                  // fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 13,
                right: 13,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                  },
                  child: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
