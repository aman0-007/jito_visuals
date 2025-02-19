import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/forgotpassword/countdowntimer.dart';
import 'package:jito_visuals/screens/forgotpassword/otpfields.dart';
import 'package:jito_visuals/screens/forgotpassword/otpvalidation.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  final bool _isButtonPressed = false;
  bool _isResendEnabled = false;

  void _validateOtp() {
    final enteredOtp = "${_otpController1.text}${_otpController2.text}${_otpController3.text}${_otpController4.text}";
    if (enteredOtp == "1234") {
      //print("OTP Validated Successfully!");
    } else {
      //print("Invalid OTP");
    }
  }

  void _resendOtp() {
    if (_isResendEnabled) {
      // Resend OTP logic
      //print("OTP resent");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpField(controller: _otpController1, focusNode: _focusNode1, nextFocusNode: _focusNode2),
                OtpField(controller: _otpController2, focusNode: _focusNode2, nextFocusNode: _focusNode3, prevFocusNode: _focusNode1),
                OtpField(controller: _otpController3, focusNode: _focusNode3, nextFocusNode: _focusNode4, prevFocusNode: _focusNode2),
                OtpField(controller: _otpController4, focusNode: _focusNode4, prevFocusNode: _focusNode3),
              ],
            ),
            const SizedBox(height: 20),
            OtpValidationButton(isButtonPressed: _isButtonPressed, onTap: _validateOtp),
            const SizedBox(height: 10),
            CountdownAndResend(onResendEnabled: () {
              setState(() {
                _isResendEnabled = true;
              });
              _resendOtp(); // Trigger resend OTP
            }),
          ],
        ),
      ),
    );
  }
}
