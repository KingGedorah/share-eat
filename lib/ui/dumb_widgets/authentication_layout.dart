import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final String validationMessage;
  final Widget form;
  final bool showTermsText;
  final bool busy;
  final Function onMainButtonTapped;
  final Function onCreateAccountTapped;
  final Function onBackPressed;
  
  

  const AuthenticationLayout({required Key key, required this.title, required this.subtitle, required this.mainButtonTitle, required this.validationMessage, required this.form, required this.showTermsText, required this.busy, required this.onMainButtonTapped, required this.onCreateAccountTapped, required this.onBackPressed}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if(onBackPressed == null) verticalSpaceLarge,
          if(onBackPressed != null) verticalSpaceRegulara,
        ],
      ),
    );
  }
}
