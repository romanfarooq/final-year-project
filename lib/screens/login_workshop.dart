import 'package:car_care/utils/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'forget_screen.dart';
import '../routes/app_routes.dart';
import '../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreenW extends StatefulWidget {
  const LoginScreenW({super.key});

  @override
  State<LoginScreenW> createState() => _LoginScreenWState();
}

class _LoginScreenWState extends State<LoginScreenW> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _userNameController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the next screen upon successful login
      Navigator.of(context).pushReplacementNamed(AppRoutes.workshopSignupScreen);
      ToastMessage().toastmessage('Login Successful');
    } catch (error) {
      // Handle specific Firebase Auth errors
      String errorMessage = "Login failed. ";
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'invalid-email':
            errorMessage += "Invalid email address.";
            break;
          case 'user-not-found':
          case 'wrong-password':
            errorMessage += "Invalid email or password.";
            break;
          default:
            errorMessage += "An error occurred (${error.code}).";
        }
      } else {
        // Handle other errors such as network issues, etc.
        errorMessage += "Unexpected error occurred.";
      }
      // Display error message using toast
      ToastMessage().toastmessage(errorMessage);
    }
  }

  // Future<void> signInWithGoogle() async {
  //  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //
  //  try {
  //    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //
  //
  //    if(googleSignInAccount != null){
  //       final GoogleSignInAuthentication googleSigninAuthentication = await googleSignInAccount.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSigninAuthentication.idToken,
  //         accessToken: googleSigninAuthentication.accessToken,
  //       );
  //      // await _firebaseAuth.signInWithCredential(credential);
  //    }
  //  }catch(e){
  //    ToastMessage().toastmessage(e.toString());
  //  }
  // }
  //

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: '812183513091-lq3q9surkcqlekrgma3lle9r00i1e3es.apps.googleusercontent.com', // Replace with your Web client ID
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null || !mounted) {
        return; // The user canceled the sign-in or the widget is not mounted
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) {
        return; // Check again if the widget is still mounted before updating UI
      }

      // Navigate to the next screen upon successful login
      Navigator.of(context).pushReplacementNamed(AppRoutes.workshopSignupScreen);
      ToastMessage().toastmessage('Google Sign-In Successful');
    } catch (error) {
      if (!mounted) {
        return; // Check if the widget is still mounted before displaying error message
      }
      ToastMessage().toastmessage('Google Sign-In failed: ${error.toString()}');
      print(error.toString());
    }
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
                  SizedBox(height: screenHeight * 0.01),
                  Image.asset(
                    ImageConstant.carcare2,
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.4,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    "Login ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02),
                    child: Text(
                      "Welcome to Car Car Pro",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    controller: _userNameController,
                    hintText: "Email",
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(
                        screenWidth * 0.02,
                        screenHeight * 0.01,
                        screenWidth * 0.04,
                        screenHeight * 0.01,
                      ),
                      child: Icon(Icons.email_outlined,
                        size: 25,
                        // height: screenHeight * 0.03,
                        // width: screenWidth * 0.06,
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
                      child: Icon(Icons.lock_outline_sharp,
                        size: 25,
                        // height: screenHeight * 0.03,
                        // width: screenWidth * 0.06,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: screenHeight * 0.1,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  InkWell(
                    onTap: (){
                      //Navigator.of(context).pushReplacementNamed(AppRoutes.userHomeScreen);
                      Navigator.of(context).pushReplacementNamed(AppRoutes.forgetScreen);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.titleSmall,),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    text: "Login",
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
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
                    onPressed: () {
                      login();
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  CustomElevatedButton(
                    text: "Sign in with Google",
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        begin: const Alignment(0.5, 0),
                        end: const Alignment(0.5, 1),
                        colors: [
                          const Color(0XFF6E7CB9),
                          Theme.of(context).colorScheme.primary,
                        ],
                      ),
                    ),
                    leftIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    onPressed: () {
                      signInWithGoogle(context);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            color: const Color(0XFF040415).withOpacity(0.4),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppRoutes.signUpScreen);
                            },
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                color: const Color(0XFFFF5B00),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
