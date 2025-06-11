import 'package:flutter/material.dart';
import 'package:stylishcloset/screens/collection/widget/cart_collection.dart';
import 'package:stylishcloset/widgets/common/navigation.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Collection',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Image.asset( "assets/images/logo.png", width:50, height:50),
          onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationScreen()));
        }), 
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: Image.asset("assets/images/logo.png", width: 40, height: 40),
        //   )
        // ],
        ),
      body:

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
           children: [
            CartCollection(title: "Wedding", image: "assets/images/logo.png", color: "0xFF847B7B"),
           ],
          ),
        ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}