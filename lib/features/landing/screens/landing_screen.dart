import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text('Welcome To CHaTiFY ',
            style: TextStyle(
              fontSize: 33,
              fontFamily:'Itim',
              // fontWeight: FontWeight.bold,
              fontWeight: FontWeight.w600,
            )),
            SizedBox(height: size.height/9),
            Image.asset('assets/bg1.gif',
            height: 340, width: 340,),
            SizedBox(height: size.height / 6,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Read our Privacy Policy. Tap "Agree and Continue" to accept the Terms of Service', style: TextStyle(color: greyColor), textAlign: TextAlign.center,),

            ),
            const SizedBox(height: 10,),
            
            SizedBox(
              width: size.width *0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => navigateToLoginScreen(context),
              )
            ),
      ],
    )));
  }
}