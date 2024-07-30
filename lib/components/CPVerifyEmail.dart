import 'package:VESTNET3/screen/CPLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:VESTNET3/utils/CPColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CPVerifyEmail extends StatefulWidget {
  @override
  CPVerifyEmailState createState() => CPVerifyEmailState();
}

class CPVerifyEmailState extends State<CPVerifyEmail> {
  final List<TextEditingController> _otpControllers = List.generate(5, (_) => TextEditingController());
  final List<FocusNode> _otpFocusNodes = List.generate(5, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    // Initial focus on the first OTP field
    _otpFocusNodes[0].requestFocus();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _resendCode() {
    // Implement resend OTP code logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kode OTP dikirim ulang!')),
    );
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
                height: MediaQuery.of(context).size.height * 0.3, // Adjust the height as needed
                child: Stack(
                  children: [
                    Positioned(child: Image.asset("images/HeaderLogin.png")),
                    Positioned(
                      top: 64,
                      left: 34,
                      child: Text(
                        'Verifikasi Email',
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
                        'Cek Email Anda \nuntuk melihat kode OTP',
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
              // OTP input fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    24.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Container(
                          width: 48,
                          height: 48,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: TextField(
                            controller: _otpControllers[index],
                            focusNode: _otpFocusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                    
                            decoration: InputDecoration(
                              counterText: '', // Hide the counter text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 4) {
                                FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          // Handle OTP verification logic here
                          // Example: OTP verification logic and navigation
                          CPLoginScreen().launch(context);
                        },
                        color: Color(0xff1e8c45),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Text(
                          "Verifikasi",
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
                          "Belum menerima kode? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: _resendCode,
                          child: Text(
                            "Kirim Ulang",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: CPPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
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
