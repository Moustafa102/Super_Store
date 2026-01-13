import 'package:flutter/material.dart';

class ProductDetail  extends StatelessWidget {
  const ProductDetail ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(


            children: [

              Container(

                width: 150,
                height: 170,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF8F7F7)
                ),
              ),

              Container(
                //margin:EdgeInsets.symmetric(horizontal: 6),



                width: 520,
                height: 450,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Image.asset("assets/images/detailPic.png",
                      width: 520,
                      height: 450,
                      fit: BoxFit.cover,

                    ),
                  ],

                ),
              ),
              Positioned(
                top: 60,
                right: 15,
                child:
                CircleAvatar(
                  child: Icon(Icons.favorite_rounded,
                    color: Colors.grey,
                  ),
                ),),

              Positioned(
                top: 60,
                left: 15,
                child: CircleAvatar(
                  child: Icon(Icons.arrow_back),
                ),
              )
            ],

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [


                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,8.0,0,0 ),
                    child: Text("Nike Shoes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,

                      ),
                        ),
                  ),

                  Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,8,0,0),
                        child: Icon(Icons.star,
                          color: Colors.amber,
                          size: 40,

                        ),
                      ),
                      SizedBox(width: 5),

                      Text("4.5",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),

                      ),

                      SizedBox(width: 8,),

                      Text("(Review)",
                        style: TextStyle(
                          color: Color(0xff7D7A7A),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),

                      ),

                    ],
                  )
                ],

              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text("\$430",

                  style: TextStyle(
                    color: Color(0xff6055D8),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),


                ),
              ),

            ],

          ),

          SizedBox(height: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Description",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16.0,8,0,0),
            child: Text("Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi."),
          ),

          SizedBox(height: 8,),


          Padding(
            padding: const EdgeInsets.fromLTRB(16.0,8,0,0),
            child: Text("Size",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),


            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              children: [
                ElevatedButton(

                    onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6055D8),
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 90),
                    //minimumSize: const Size.fromHeight(60),

                  ),
                    child: Text("Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),

                    ),
                ),
                SizedBox(width: 30),
                ElevatedButton(

                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff8f7f7a6),
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                  ),
                  child: Icon(Icons.shopping_bag_rounded,
                    size: 30,

                  ),

                ),
              ],
            ),
          )



        ],
      ),





    );
  }
}
