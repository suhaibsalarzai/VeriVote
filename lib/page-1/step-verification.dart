import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/VoteStatus.dart';
import 'package:myapp/page-1/on-going-elections.dart';
import 'package:myapp/utils.dart';
import 'package:pinput/pinput.dart';

class TwoStepVerify extends StatefulWidget {
  String verificationId;
  String userName;
  int IdNum;
  TwoStepVerify(
      {super.key,
      required this.verificationId,
      required this.IdNum,
      required this.userName});

  @override
  State<TwoStepVerify> createState() => _TwoStepVerifyState();
}

class _TwoStepVerifyState extends State<TwoStepVerify> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 50,
                height: 50,
                child: Image.asset(
                  'assets/page-1/images/go_back.png',
                  // width: 20,
                  // height: 20,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(20 * fem, 7 * fem, 24 * fem, 64 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      child: Text(
                        'Two-Step Verification',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 312 * fem,
                      ),
                      child: Text(
                        'You will receive a two-step verification code on your mobile number.',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff94a0b4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 80,
                      child: Pinput(
                        controller: _idController,
                        showCursor: true,
                        keyboardType: TextInputType.phone,
                        closeKeyboardWhenCompleted: true,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                          height: 80,
                          width: 80,
                          textStyle: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Colors.blueGrey,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   // frame207diW (2:1086)
                    //   margin: EdgeInsets.fromLTRB(
                    //       24 * fem, 0 * fem, 24 * fem, 29 * fem),
                    //   width: double.infinity,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         margin: EdgeInsets.fromLTRB(
                    //             0 * fem, 0 * fem, 9 * fem, 0 * fem),
                    //         child: Text(
                    //           'Didn’t receive the code?',
                    //           style: SafeGoogleFont(
                    //             'Poppins',
                    //             fontSize: 14 * ffem,
                    //             fontWeight: FontWeight.w500,
                    //             height: 1.5 * ffem / fem,
                    //             color: Color(0xff707e94),
                    //           ),
                    //         ),
                    //       ),
                    //       Text(
                    //         'Resend (0:09)',
                    //         style: SafeGoogleFont(
                    //           'Poppins',
                    //           fontSize: 14 * ffem,
                    //           fontWeight: FontWeight.w500,
                    //           height: 1.5 * ffem / fem,
                    //           color: Color(0xffeb5757),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () async {
                        final credentials = PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: _idController.text.toString());

                        try {
                          await auth.signInWithCredential(credentials);

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => Elections(
                                        name: widget.userName,
                                        id: widget.IdNum,
                                      )));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid Code retry'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          print('This is the error $e');
                        }
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => Elections()));
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            122.5 * fem, 14 * fem, 125.5 * fem, 14 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff3496e0),
                          borderRadius: BorderRadius.circular(8 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f3496e0),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 6 * fem,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // verifyQFQ (2:1089)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 13 * fem, 0 * fem),
                              child: Text(
                                'Verify',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Container(
                              width: 18 * fem,
                              height: 12 * fem,
                              child: Image.asset(
                                'assets/page-1/images/arrow-right.png',
                                width: 18 * fem,
                                height: 12 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
