import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_text_field.dart';
import 'package:food_app_getx/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            isReadOnly: true,
            initialValue: app_data.user.email,
            icon: Icons.email, 
            label: 'Email'
          ),
          CustomTextField(
            isReadOnly: true,
            initialValue: app_data.user.name,
            icon: Icons.person, 
            label: 'Name'
          ),
          CustomTextField(
            isReadOnly: true,
            initialValue: app_data.user.phone,
            icon: Icons.phone, 
            label: 'Phone'
          ),
          CustomTextField(
            isReadOnly: false,
            initialValue: app_data.user.password,
            icon: Icons.lock,
            isSecret: true, 
            label: 'Password'
          ),

          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onPressed: () {
                updatePassword();
              }, 
              child: const Text("Update Password")
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context, 
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Update password',
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock, 
                      label: 'Current Password'
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock, 
                      label: 'New Password'
                    ),
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock, 
                      label: 'Confirm New Password'
                    ),

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        onPressed: () {}, 
                        child: const Text('Update')
                      ),
                    )
                  ],
                ),
              ),

              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                )
                
              )
            ],
          ),
        );
      }
    );
  }
}
