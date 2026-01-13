import 'package:flutter/material.dart';

class ProductCustom extends StatelessWidget {
  const ProductCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(


      children: [

        Container(

          width: 150,
          height: 170,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Color(0xffF8F7F7)
          ),
        ),

        Container(
          margin:EdgeInsets.symmetric(horizontal: 6),

          width: 150,
          height: 170,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Color(0xffF8F7F7),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Image.asset("assets/images/watch.png",
                width: 150,
                height: 120,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0 ,0.0, 0.0),
                child: Column(
                  children: [

                    Text("Watch",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),

                    ),

                    Text("\$40",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6055D8)
                      ),
                    ),


                  ],
                ),
              ),


            ],

          ),
        ),

        Positioned(
          top: 8,
          right: 8,
          child:
          Icon(Icons.favorite_outline,
            color: Colors.white,
          ),)


      ],


    );
  }
}
