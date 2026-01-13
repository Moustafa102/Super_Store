import 'package:flutter/material.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(

        children: [
          Image.asset("assets/images/userPhoto.png"),

          SizedBox(width: 8,),

          Column(
            spacing: 2,
            children: [
              Text("Hello!",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

              Text("John William",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          )

        ],

      ),

      actions: [

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(

            backgroundColor: Color(0xffF8F7F7),
            child: Icon(Icons.notifications,
              color: Color(0xff7C7979),

            ),
          ),
        )
      ],
    );
  }
}

