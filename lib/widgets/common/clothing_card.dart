import 'package:flutter/material.dart';

class ClothingCard extends StatelessWidget {
  final int id;
  final String name;
  final List<String> tag;
  final String image;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ClothingCard({
    super.key,
    required this.id,
    required this.name,
    required this.tag,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              image,
              height: 320,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 13,
              right: 13,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 24,
                ),
                // onPressed: () {
                //   setState(() {
                //     isFavorited = !isFavorited;
                //   });
                // // This would call HomeScreen's toggleFavorite in a real implementation
                // },
                onPressed: onFavoriteToggle,
              ),
            )
        ],
      ),
    );
       
    
  }
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 250,
//       child: Card(
//         elevation: 4,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: EdgeInsets.all(0),
//           child: Stack(
//             children: [
//               Center(
//                 child: Image.asset(
//                   widget.image,
//                   height: 320,
//                   width: 250,
//                 ),
//               ),

//               Positioned(
//                 top: 13,
//                 right: 13,
//                 child: GestureDetector(
//                   // onTap: () {
//                   //   setState(() {
//                   //     isFavorited = !isFavorited;
//                   //   });
//                   // },
//                   onTap: () {
//                     widget.onFavoriteToggle(); // Notify parent first
//                     setState(() {}); // Rebuild to reflect potential parent state changes
//                   },
//                   child: Icon(
//                     isFavorited ? Icons.favorite : Icons.favorite_border,
//                     color: isFavorited ? Colors.red : Colors.grey,
//                     size: 24,
//                   ),
//                 ),
                
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
