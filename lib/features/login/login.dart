import 'package:final_project/features/sign%20up/signup.dart';
import 'package:final_project/widgets/app_field.dart';
import 'package:final_project/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,

              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child:Container(
                    decoration: BoxDecoration(color: Color(0xff6055D8),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    height: 135,
                    width: 343,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              Text("Get Winter Discount",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),

                              ),
                              Text("20% Of",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),

                              ),
                              Text("For Childern",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),
                              ),


                            ],
                          ),

                          Image.asset("assets/images/childLogin.png"),




                        ],
                      ),
                    ),
                    
                    
                  )),
                ),
                
                Text("Enter your name",
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight
                  ),

                ),


                AppField(hintText: "Enter You User Nam", endIcon: SizedBox(), obscureText: false, hint: 'Enter You User Nam',),

                Text("Password ",
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight
                  ),

                ),

                CustomPasswordField(hintText: "Enter Your password"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Row(

                      children: [

                        Icon(Icons.check_box_outline_blank),

                        SizedBox(width: 8,),

                        Text("Remember me")


                      ],
                    ),

                    Text("Forget password?",

                      style: TextStyle(
                      ),

                    )

                  ],
                ),

                SizedBox(height: 16,),


                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6055D8),
                      minimumSize: const Size.fromHeight(60),

                    ),

                    child: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),

                    )),

                SizedBox(height: 16,),




                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t  have an account?",

                      style: TextStyle(
                        color: Color(0xff808080),
                        fontSize: 15,

                      ),


                    ),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signup(),)),
                      child: Text("Sign up",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,


                        ),

                      ),
                    )

                  ],

                )



              ],
            ),
          ),
        ),
      ),






    );
  }
}
