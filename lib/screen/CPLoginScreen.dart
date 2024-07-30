import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VESTNET3/utils/CPColors.dart';
import 'package:VESTNET3/screen/CPDashBoardScreen.dart';
import 'package:VESTNET3/screen/CPSignUpScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:VESTNET3/utils/constant.dart';
import 'package:VESTNET3/services/auth_service.dart'; // Import AuthService

class CPLoginScreen extends StatefulWidget {
  @override
  CPLoginScreenState createState() => CPLoginScreenState();
}

class CPLoginScreenState extends State<CPLoginScreen> {
  bool isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  String? emailError;
  String? passError;

  final AuthService _authService = AuthService(); // Inisialisasi AuthService

  @override
  void initState() {
    super.initState();
  }

  Future<void> validateAndSubmit() async {
    setState(() {
      emailError = emailController.text.isEmpty
          ? 'Email tidak boleh kosong'
          : !isEmailValid(emailController.text)
              ? 'Email tidak valid'
              : null;

      passError = passController.text.isEmpty ? 'Password tidak boleh kosong' : null;
    });

    if (emailError == null && passError == null) {
      final email = emailController.text;
      final password = passController.text;

      // Panggil login service
      final success = await _authService.login(email, password);

      if (success) {
        // Navigate to dashboard on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CPDashBoardScreen()),
        );
      } else {
        showToast('Login gagal. Periksa kredensial Anda.');
      }
    }
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: [
                    Positioned(child: Image.asset("images/HeaderLogin.png")),
                    Positioned(
                      top: 64,
                      left: 34,
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.inter(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 34,
                      child: Text(
                        'Masuk ke akun Anda',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      obscureText: false,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passFocus);
                      },
                      focusNode: emailFocus,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      decoration: CustomInputDecoration.getDecoration(
                        hintText: "Email",
                      ).copyWith(
                        errorText: emailError,
                      ),
                    ),
                    24.height,
                    TextField(
                      controller: passController,
                      obscureText: !isPasswordVisible,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      focusNode: passFocus,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add navigation to Forgot Password screen
                        },
                        child: Text(
                          'Lupa Password?',
                          style: TextStyle(color: CPPrimaryColor),
                        ),
                      ),
                    ),
                    18.height,
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          validateAndSubmit();
                        },
                        color: CPButtonColor, // Adjust according to your theme
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        height: 40,
                      ),
                    ),
                    24.height,
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Atau masuk dengan",
                            style: TextStyle(
                              fontSize: 14,
                              color: CPPrimaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: CPPrimaryColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    24.height,
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 1 / 3,
                        child: MaterialButton(
                          onPressed: () {
                            // Handle Google sign-in
                            CPDashBoardScreen().launch(context);
                          },
                          color: context.cardColor,
                          elevation: 1,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/Google.png",
                                height: 24,
                                width: 24,
                              ), 
                              SizedBox(width: 6),
                              Text(
                                "Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff9d9d9d),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    24.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tidak Punya Akun?  ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: CPPrimaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            CPSignUpScreen().launch(context);
                          },
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
