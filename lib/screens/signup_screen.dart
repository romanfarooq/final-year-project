import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.05,
              screenHeight * 0.01,
              screenWidth * 0.05,
              0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.08),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0XFF040415),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  "Find your dream car!",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildFullName(context, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                _buildEmail(context, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                _buildPhoneNumber(context, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                _buildPassword(context, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.03),
                _buildSignUpButton(context),
                SizedBox(height: screenHeight * 0.02),
                _buildLine(context, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "Sign Up with",
                  style: TextStyle(
                    color: Color(0XFF040415),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.facebook,
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.06,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.12),
                      child: SvgPicture.asset(
                        ImageConstant.instagram,
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.06,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.12),
                      child: SvgPicture.asset(
                        ImageConstant.youtube,
                        height: screenHeight * 0.025,
                        width: screenWidth * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                              .pushReplacementNamed(AppRoutes.loginScreen);
                        },
                        child: const Text(
                          "Sign In",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullName(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.01,
        0,
        screenWidth * 0.01,
        0,
      ),
      child: CustomTextFormField(
        controller: _fullNameController,
        hintText: "Full name",
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
    );
  }

  Widget _buildEmail(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.01,
        0,
        screenWidth * 0.01,
        0,
      ),
      child: CustomTextFormField(
        controller: _emailController,
        hintText: "Email address",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(
            screenWidth * 0.02,
            screenHeight * 0.01,
            screenWidth * 0.04,
            screenHeight * 0.01,
          ),
          child: Image.asset(
            ImageConstant.email,
            height: screenHeight * 0.03,
            width: screenWidth * 0.06,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: screenHeight * 0.1,
        ),
      ),
    );
  }

  Widget _buildPhoneNumber(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.01,
        0,
        screenWidth * 0.01,
        0,
      ),
      child: CustomTextFormField(
        controller: _phoneNumberController,
        hintText: "Phone number",
        textInputType: TextInputType.phone,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(
            screenWidth * 0.02,
            screenHeight * 0.01,
            screenWidth * 0.04,
            screenHeight * 0.01,
          ),
          child: Image.asset(
            ImageConstant.phone,
            height: screenHeight * 0.03,
            width: screenWidth * 0.06,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: screenHeight * 0.1,
        ),
      ),
    );
  }

  Widget _buildPassword(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.01,
        0,
        screenWidth * 0.01,
        0,
      ),
      child: CustomTextFormField(
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
            height: screenHeight * 0.03,
            width: screenWidth * 0.06,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: screenHeight * 0.1,
        ),
        obscureText: true,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Sign Up",
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            const Color(0XFF6E7CB9),
            Theme.of(context).colorScheme.primary,
          ],
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.selectUserScreen);
      },
    );
  }

  Widget _buildLine(
      BuildContext context, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        screenWidth * 0.01,
        0,
        screenWidth * 0.01,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: screenWidth * 0.25,
            child: const Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.015),
            child: Text(
              "Or",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: const Color(0XFF040415).withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.27,
            child: Divider(
              indent: screenWidth * 0.01,
            ),
          ),
        ],
      ),
    );
  }
}
