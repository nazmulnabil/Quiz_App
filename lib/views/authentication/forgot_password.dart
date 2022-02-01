import 'package:exp_quiz_app/constants/app_colors.dart';
import 'package:exp_quiz_app/constants/app_values.dart';
import 'package:exp_quiz_app/constants/size_config.dart';
import 'package:exp_quiz_app/constants/text_styles.dart';
import 'package:exp_quiz_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme_colors.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenWidth! / 2,
                  decoration: const BoxDecoration(
                      color: ThemeColors.baseThemeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )),
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0, left: 16),
                        child: Text(
                          'iTest',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorLightGreen),
                        ),
                      ),
                      const SizedBox(height: AppValues.margin_10),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                        child: Text(
                          'Forgot Password',
                          style: whiteText18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Forgot your password?', style: whiteText16),
                            Text(
                              "Don't worry",
                              style: lightGreenText16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),

            Positioned(
              top: SizeConfig.screenHeight! / 3,
              left: AppValues.padding,
              right: AppValues.padding,
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: Form(
                  //key: _formKey,
                  child: Column(
                    children: [
                      ///Email Input Field
                      SizedBox(
                        height: 60,
                        child: TextFormField(
                          // controller: _emailController,
                          textInputAction: TextInputAction.done,

                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ThemeColors.primaryColor,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            hintText: 'Enter your email here',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: ThemeColors.baseThemeColor,
                            ),
                            fillColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: ThemeColors.baseThemeColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //sign in button
                      const SizedBox(
                        height: AppValues.height_16,
                      ),

                      Container(
                        margin: const EdgeInsets.only(
                          top: AppValues.margin_30,
                        ),
                        width: SizeConfig.screenWidth,
                        child: ElevatedCustomButton(
                          text: "Recover Password",
                          fontsize: AppValues.fontSizelarge,
                          buttonHeight: AppValues.padding,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //Container app bar
          ],
        ),
      ),
      //authentication Content container
    );
  }
}
