import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/collection/collection_detail_page.dart';

class CartCollection extends StatelessWidget {
  final String title;
  final String image;
  final String color;
  final Color? backgroundColor;

  const CartCollection({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Color parsedColor;
    try {
      parsedColor = Color(int.parse(color.replaceFirst('0xFF', '0xFF'), radix: 16));
    } catch (e) {
      parsedColor = Colors.grey;
      print('Error parsing color $color: $e');
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final marginValue = screenWidth * 0.03;
    final paddingValue = screenWidth * 0.02;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CollectionDetailPage(title: title,)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: marginValue.clamp(12.0, 20.0)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              (backgroundColor ?? parsedColor).withOpacity(0.9),
              (backgroundColor ?? parsedColor).withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 140,
              padding: EdgeInsets.all(paddingValue.clamp(8.0, 16.0)),
              decoration: BoxDecoration(
                color: backgroundColor ?? parsedColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: useWhiteText(backgroundColor ?? parsedColor)
                        ? Colors.white
                        : Colors.black87,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool useWhiteText(Color color) {
    final brightness = (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);
    return brightness < 150;
  }
}