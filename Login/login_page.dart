import 'package:ai_voice_app/screens/auth%20screens/login/widgets/navigateToSignUpPageButton.dart';
import 'package:ai_voice_app/screens/home/home_screen.dart';
import 'package:ai_voice_app/services/auth/auth_services.dart';
import 'package:ai_voice_app/styles.dart';
import 'package:ai_voice_app/widgets/generalCustomButton.dart';
import 'package:ai_voice_app/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: Styles.normalTextStyle.copyWith(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Styles.largeSpacer,
            AppText.normalWhite(text: "Enter Your Email & Password"),
            Styles.smallSpacer,
            AuthField(
                inputType: TextInputType.emailAddress,
                controller: emailController,
                hintText: "Email",
                icon: CupertinoIcons.mail,
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                }),
            Styles.smallSpacer,
            AuthField(
              obscureText: true,
              controller: passwordController,
              hintText: "Password",
              icon: CupertinoIcons.lock_shield,
            ),
            Styles.smallSpacer,
            GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.end,
                style: Styles.normalTextStyle.copyWith(fontSize: 15),
              ),
            ),
            Styles.mediumSpacer,
            GeneralButton(
              buttonText: "Sign In",
              onPressed: () async {
                var navigator = Navigator.of(context);
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  bool isSigninSuccesful = await AuthenticationServices()
                      .loginWithEmailPassword(emailController.text,
                          passwordController.text, context);
                  if (isSigninSuccesful) {
                    navigator.pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                }
              },
            ),
            Styles.mediumSpacer,
            const NavigateToSignupPage(),
          ],
        ),
      ),
    );
  }
}

class AuthField extends StatelessWidget {
  AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscureText,
      this.onEditingComplete,
      this.inputType});

  final TextEditingController controller;
  String hintText;
  IconData icon;
  bool? obscureText;
  VoidCallback? onEditingComplete;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Styles.iconButtonBgColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        controller: controller,
        style: Styles.normalTextStyle,
        textInputAction: TextInputAction.next,
        keyboardType: inputType ?? TextInputType.text,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Styles.normalTextStyle.copyWith(fontSize: 15),
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Styles.textAndIconColorWhite,
          ),
        ),
        obscureText: obscureText ?? false,
      ),
    );
  }
}
