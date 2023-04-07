import 'package:flutter/material.dart';
import 'package:food_app_getx/src/auth/components/custom_text_field.dart';

//Screen Login
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                    fontSize: 40,
                  ),
                  children: [
                    TextSpan(
                      text: 'Green',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    TextSpan(
                      text: 'grocer',
                      style: TextStyle(
                        color: Colors.red
                      )
                    )
                  ]
                  )
                ),
                Text("Fruits")
              ],
            )
          ),
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
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    )
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  )
                ),
              ),

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
                onPressed: () {}, 
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
    );
  }
}
