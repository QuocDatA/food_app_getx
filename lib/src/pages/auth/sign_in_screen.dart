import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_text_field.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/pages/auth/sign_up_screen.dart';

import '../base/base_screen.dart';

//Screen Login
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
            
            //Text Title
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Green',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        TextSpan(
                          text: 'grocer',
                          style: TextStyle(
                            color: CustomColor.customContrasColor
                          )
                        )
                      ]
                      )
                    ),
      
                    //Animation text under title
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Fruits'),
                            FadeAnimatedText('Vegetables'),
                            FadeAnimatedText('Meats'),
                            FadeAnimatedText('Products'),
                          ]
                        ),
                      ),
                    )
                  ],
                )
              ),

              //Edit text input login
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
              ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45))
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Email
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    isSecret: false,
                  ),
                  //Password
                  const CustomTextField(
                    icon: Icons.lock,
                    label: "Password",
                    isSecret: true,
                  ),

                  //Button Login
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        )
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) {
                            return const BaseScreen();
                          })
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                  ),

                  //Forget password
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.red),
                      )
                    ),
                  ),
      
                  //Divider
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          )
                        ), 
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('Or'),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          )
                        ), 
                      ],
                    ),
                  ),

                  //Outline Button sign up
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green
                      )
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) {
                          return SignUpScreen();
                        })
                      );
                    }, 
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                      )
                  )
                  
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
