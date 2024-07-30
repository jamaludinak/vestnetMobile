import 'package:VESTNET3/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VESTNET3/components/CPVerifyEmail.dart';
import 'package:VESTNET3/screen/CPLoginScreen.dart';
import 'package:VESTNET3/utils/CPColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CPSignUpScreen extends StatefulWidget {
  @override
  CPSignUpScreenState createState() => CPSignUpScreenState();
}

class CPSignUpScreenState extends State<CPSignUpScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode confirmPassFocus = FocusNode();

  String? nameError;
  String? emailError;
  String? phoneError;
  String? passError;
  String? confirmPassError;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // Initialization code
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool isEmailValid(String email) {
    // Simple email validation regex
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool isPhoneValid(String phone) {
    // Simple phone number validation regex (Indonesia)
    return RegExp(r'^\+?[0-9]{8,15}$').hasMatch(phone);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password);
  }

  void validateAndSubmit() {
    setState(() {
      nameError = nameController.text.isEmpty ? 'Nama tidak boleh kosong' : null;
      emailError = !isEmailValid(emailController.text) ? 'Email tidak valid' : null;
      phoneError = !isPhoneValid(phoneController.text) ? 'Nomor telepon tidak valid' : null;

      if (passController.text.isEmpty) {
        passError = 'Password tidak boleh kosong';
      } else if (passController.text.length < 6) {
        passError = 'Password terlalu pendek';
      } else if (!RegExp(r'[A-Z]').hasMatch(passController.text) ||
          !RegExp(r'[0-9]').hasMatch(passController.text)) {
        passError = 'Password harus mengandung huruf besar dan angka';
      } else {
        passError = null;
      }

      confirmPassError = passController.text != confirmPassController.text
          ? 'Konfirmasi password tidak sesuai'
          : null;
    });

    if (nameError == null &&
        emailError == null &&
        phoneError == null &&
        passError == null &&
        confirmPassError == null) {
      CPVerifyEmail().launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Header section
              Container(
                height: MediaQuery.of(context).size.height * 0.3, // Adjusted height
                child: Stack(
                  children: [
                    Positioned(child: Image.asset("images/HeaderLogin.png")),
                    Positioned(
                      top: 64, // Adjusted position
                      left: 34,
                      child: Text(
                        'Daftar Akun',
                        style: GoogleFonts.inter(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120, // Adjusted position
                      left: 34,
                      child: Text(
                        'Buat akun baru Anda',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Form section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameController,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Nama Lengkap",
                      ).copyWith(
                        errorText: nameError,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(phoneFocus);
                      },
                      focusNode: emailFocus,
                      keyboardType: TextInputType.emailAddress, // Keyboard for email
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Email",
                      ).copyWith(
                        errorText: emailError,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: phoneController,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      focusNode: phoneFocus,
                      keyboardType: TextInputType.phone, // Keyboard for phone numbers
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Nomor Telepon",
                      ).copyWith(
                        errorText: phoneError,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passController,
                      obscureText: !isPasswordVisible,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      focusNode: passFocus,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Password",
                      ).copyWith(
                        errorText: passError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xffa7a7a7),
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: confirmPassController,
                      obscureText: !isConfirmPasswordVisible,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      focusNode: confirmPassFocus,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Konfirmasi Password",
                      ).copyWith(
                        errorText: confirmPassError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xffa7a7a7),
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible = !isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 44),
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          validateAndSubmit();
                        },
                        color: Color(0xff1e8c45),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.normal),
                        ),
                        textColor: Color(0xffffffff),
                        height: 40,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah Punya Akun?  ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: CPPrimaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            CPLoginScreen().launch(context);
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: CPPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
