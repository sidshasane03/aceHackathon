import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:safeguardher_flutter_app/screens/auth_screen/signup_screen/signup_otp_screen.dart';
import 'package:safeguardher_flutter_app/screens/auth_screen/signup_screen/signup_screen1.dart';

class SignUpScreen2 extends StatefulWidget {
  final String username;
  final String phoneNumber;
  final String gender;

  const SignUpScreen2({
    Key? key,
    required this.username,
    required this.phoneNumber,
    required this.gender,
  }) : super(key: key);

  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  bool _isChecked = false;
  late String otpCode = _generateSafetyCode();

  String _generateSafetyCode() {
    return (1000 + Random().nextInt(9000)).toString();
  }

  bool get _isButtonEnabled {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmpasswordController.text.isNotEmpty &&
        _passwordController.text == _confirmpasswordController.text &&
        _isChecked;
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _confirmpasswordController.addListener(_updateButtonState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen1()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 0),
              SvgPicture.asset(
                'assets/logos/logo.svg',
                height: 60,
              ),
              const SizedBox(height: 30),
              SvgPicture.asset(
                'assets/illustrations/login2.svg',
                height: 45,
              ),
              const SizedBox(height: 30),
              const Text(
                'Set Up an Account',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please fill up the form below! A confirmation '
                'code will be sent to the provided email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email                                                                                  ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText:
                      'Enter your email', // Placeholder text inside the box
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              const Text(
                'Password                                                                          ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText:
                      'Enter your password', // Placeholder text inside the box
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                obscureText: !_passwordVisible,
              ),
              const SizedBox(height: 12),
              const Text(
                'Confirm Password                                                         ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  hintText:
                      'Confirm your password', // Placeholder text inside the box
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible2 = !_passwordVisible2;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                obscureText: !_passwordVisible2,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        _updateButtonState();
                      });
                    },
                  ),
                  const Text(
                    '*I accept to the Terms and Conditions',
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () async {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text ==
                                _confirmpasswordController.text) {
                          // Prepare template parameters for the email
                          Map<String, dynamic> templateParams = {
                            'name': widget.username,
                            'email': _emailController.text,
                            'message': otpCode,
                          };

                          try {
                            // Sending the email using emailjs
                            await emailjs.send(
                              'service_7yhjxvg', // Your EmailJS service ID
                              'template_66yihk3', // Your EmailJS template ID
                              templateParams,
                              const emailjs.Options(
                                publicKey: 'FjbpWqPaNlRVTl0tE',
                                privateKey: 'cM4Qmp_XYFBJVfno-RZpX',
                              ),
                            );

                            // Print success for debugging
                            print('SUCCESS! Email sent.');

                            // Navigate to OTP screen if email is sent successfully
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpOTPScreen(
                                  email: _emailController.text,
                                  username: widget.username,
                                  phoneNumber: widget.phoneNumber,
                                  gender: widget.gender,
                                  password: _passwordController.text,
                                  otpCode: otpCode,
                                ),
                              ),
                            );
                          } catch (error) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Failed to send confirmation email.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          // Show error if validation fails
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Please ensure all fields are filled correctly and passwords match.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isButtonEnabled ? const Color(0xFFD20451) : Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 14),
                ),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
