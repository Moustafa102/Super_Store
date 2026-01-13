import 'package:flutter/material.dart';

import '../../widgets/product_custom.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
          child: CircleAvatar(
            child: Icon(Icons.arrow_back),


          ),
        ),
        
        title: Text("Products",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,

          ),

        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            // height: 170,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ProductCustom(),
              scrollDirection: Axis.vertical,
            ),
          ),



        ],
      ),









    );
  }
}
