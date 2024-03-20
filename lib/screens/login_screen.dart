import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.01,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.01),
                Image.asset(
                  ImageConstant.carcare2,
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.4,
                  alignment: Alignment.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: const Text(
                    "Login ",
                    style: TextStyle(
                      color: Color(0XFF040415),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: const Text(
                    "Welcome to Car Car Pro",
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextFormField(
                  controller: _userNameController,
                  hintText: "Username",
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(
                      screenWidth * 0.02,
                      screenHeight * 0.01,
                      screenWidth * 0.04,
                      screenHeight * 0.01,
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.profile,
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.06,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: screenHeight * 0.1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(
                      screenWidth * 0.02,
                      screenHeight * 0.01,
                      screenWidth * 0.04,
                      screenHeight * 0.01,
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.lockpasswordline,
                      fit: BoxFit.cover,
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.06,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: screenHeight * 0.1,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0XFF040415),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomElevatedButton(
                  text: "Login",
                  buttonStyle: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    gradient: LinearGradient(
                      begin: const Alignment(0.5, 0),
                      end: const Alignment(0.5, 1),
                      colors: [
                        const Color(0XFF6E7CB9),
                        Theme.of(context).colorScheme.primary,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: const Color(0XFF040415).withOpacity(0.4),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.signUpScreen);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0XFFFF5B00),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(
                  ImageConstant.carcare1,
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.3,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
