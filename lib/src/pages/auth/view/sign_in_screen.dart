import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_app_getx/src/pages/auth/controller/auth_controller.dart';
import 'package:food_app_getx/src/pages/common_widget/custom_text_field.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/pages/common_widget/app_name_widget.dart';
import 'package:food_app_getx/src/pages_routes/pages_routes.dart';
import 'package:food_app_getx/src/services/validator.dart';
import 'package:get/get.dart';

//Screen Login
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
                  const AppNameWidget(
                    greenTitleColor: Colors.white,
                    textSize: 40,
                  ),

                  //Animation text under title
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child:
                          AnimatedTextKit(repeatForever: true, animatedTexts: [
                        FadeAnimatedText('Fruits'),
                        FadeAnimatedText('Vegetables'),
                        FadeAnimatedText('Meats'),
                        FadeAnimatedText('Products'),
                      ]),
                    ),
                  )
                ],
              )),

              //Edit text input login
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Email
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: emailValidator
                      ),
                      //Password
                      CustomTextField(
                        controller: passController,
                        icon: Icons.lock,
                        label: "Password",
                        isSecret: true,
                        validator: passwordValidator
                      ),

                      //Button Login
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                )),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          String email = emailController.text;
                                          String password = passController.text;

                                          authController.signIn(
                                              email: email, password: password);
                                        } else {
                                          print('A PART INVALID');
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Login",
                                        style: TextStyle(fontSize: 18),
                                      ));

                            //Get.offNamed(PagesRoutes.baseRoute);
                          },
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
                            )),
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
                            )),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Or'),
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            )),
                          ],
                        ),
                      ),

                      //Outline Button sign up
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              side: const BorderSide(
                                  width: 2, color: Colors.green)),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
