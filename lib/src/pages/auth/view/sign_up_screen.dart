import 'package:flutter/material.dart';
import 'package:food_app_getx/src/pages/common_widget/custom_text_field.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/services/validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final phoneFormatter = MaskTextInputFormatter(
    mask: '####-###-###',
    filter: {'0': RegExp(r'[0-9]')}
  );

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
      
                  //Text title
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    )
                  ),
      
                  //Format Sign up information
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 32,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45)
                      )
                    ),
                    
                    //Input text field
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.email, 
                            label: 'Email',
                            textInputType: TextInputType.emailAddress,
                            validator: emailValidator,
                          ),
                          const CustomTextField(
                            icon: Icons.lock, 
                            label: 'Password',
                            isSecret: true,
                            validator: passwordValidator,
                          ),
                          const CustomTextField(
                            icon: Icons.person ,
                            label: 'Name',
                            validator: nameValidator,
                          ),
                          const CustomTextField(
                            icon: Icons.phone, 
                            label: 'Phone',
                            textInputType: TextInputType.phone,
                            validator: phoneValidator,
                          ),
                          
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                                )
                              ),
                              onPressed: () {
                                _formKey.currentState!.validate();
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),

              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
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