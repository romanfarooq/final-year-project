import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.01,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  Image.asset(
                    ImageConstant.carcare2,
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.4,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    controller: _userNameController,
                    hintText: "   Enter Your Email",
                    prefixConstraints: BoxConstraints(
                      maxHeight: screenHeight * 0.1,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    text: "Send",
                    buttonStyle: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      elevation: WidgetStateProperty.all<double>(0),
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
                    onPressed: () {
                      auth
                          .sendPasswordResetEmail(
                              email: _userNameController.text.toString())
                          .then((onValue) {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.loginScreen);
                        ToastMessage().toastmessage(
                            'We have sent you email to recover password, please check email');
                      }).onError((error, stackTrace) {
                        ToastMessage().toastmessage(error.toString());
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  SizedBox(height: screenHeight * 0.02),
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
      ),
    );
  }
}
