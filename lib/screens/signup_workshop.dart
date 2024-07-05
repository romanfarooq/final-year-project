import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/workshop_info.dart';
import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../utils/toast_message.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpScreenW extends StatefulWidget {
  const SignUpScreenW({super.key});

  @override
  State<SignUpScreenW> createState() => _SignUpScreenStateW();
}

class _SignUpScreenStateW extends State<SignUpScreenW> {
  bool loading = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            margin: EdgeInsets.fromLTRB(
              screenWidth * 0.05,
              screenHeight * 0.01,
              screenWidth * 0.05,
              0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Find your dream car!",
                    style: Theme.of(context).textTheme.titleSmall,
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
                  _buildSignUpButtonForWorkshopOwner(context),
                  SizedBox(height: screenHeight * 0.02),
                  _buildLine(context, screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Sign Up with",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: const Color(0XFF040415).withOpacity(0.4),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.loginScreen);
                          },
                          child: Text(
                            "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: const Color(0XFFFF5B00)),
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
      ),
    );
  }

  Widget _buildFullName(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
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
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
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
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
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
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
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

  Widget _buildSignUpButtonForWorkshopOwner(BuildContext context) {
    return CustomElevatedButton(
      text: "Sign Up",
      buttonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
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
      onPressed: () async {
        if (_formKey.currentState!.validate() &&
            _fullNameController.text.isNotEmpty &&
            _phoneNumberController.text.isNotEmpty &&
            _emailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          setState(() {
            loading = true;
          });

          try {
            UserCredential userCredential =
                await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );

            ToastMessage().toastmessage('Signup Successfully');
            await _firestore
                .collection('workshops')
                .doc(userCredential.user!.uid)
                .set(
              {
                'uid': userCredential.user!.uid,
                'fullname': _fullNameController.text.trim(),
                'phone': _phoneNumberController.text.trim(),
                'email': _emailController.text.trim(),
              },
            );
            final workshop = context.read<WorkshopInfo>();
            workshop.setWorkshopInfo({
              'fullname': _fullNameController.text.trim(),
              'phone': _phoneNumberController.text.trim(),
              'email': _emailController.text.trim(),
              'uid': userCredential.user!.uid,
            });

            setState(() {
              loading = false;
            });

            Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreenW);
          } catch (error) {
            setState(() {
              loading = false;
            });
            ToastMessage().toastmessage(error.toString());
          }
        } else {
          ToastMessage().toastmessage('Please fill in all fields');
        }
      },
    );
  }

  Widget _buildLine(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: const Color(0XFF040415).withOpacity(0.4)),
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
