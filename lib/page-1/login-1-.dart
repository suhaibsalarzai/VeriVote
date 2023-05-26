import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/page-1/VoteStatus.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/step-verification.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isKeyboardVisible = false; // to keep track of keyboard visibility
  final FocusNode _idFocusNode = FocusNode(); // to listen for focus changes

  bool _isLoading = false;
  final auth = FirebaseAuth.instance;
  final TextEditingController _idController = TextEditingController();

  Future<void> _checkID(BuildContext context) async {
    int? id = int.tryParse(_idController.text);
    if (id == null) {
      // Show error message for invalid ID
      print('Not corret data format');

      return;
    }

    // Query the Firebase collection for the entered ID
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('personal id', isEqualTo: id)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final phoneNumber = snapshot.docs.first.get('phone number');
      final idNumber = snapshot.docs.first.get('personal id');
      final personName = snapshot.docs.first.get('name');
      print(phoneNumber);
      print(idNumber);
      print(personName);

      auth.verifyPhoneNumber(
          //something here regarding country code
          phoneNumber: phoneNumber,
          verificationCompleted: (_) {
            setState(() {
              _isLoading = false; // set isLoading to true while loading data
            });
          },
          verificationFailed: (e) {
            setState(() {
              _isLoading = false; // set isLoading to true while loading data
            });
            print(e);
          },
          //user is verified from this id
          codeSent: (String verificationID, int? token) {
            setState(() {
              _isLoading = false; // set isLoading to true while loading data
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => TwoStepVerify(
                        verificationId: verificationID,
                        userName: personName,
                        IdNum: idNumber,
                      )),
            );
          },
          codeAutoRetrievalTimeout: (e) {
            setState(() {
              _isLoading = false; // set isLoading to true while loading data
            });
            print(e);
          });
    } else {
      // Show error message for user not found
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User not found'),
            content: const Text('The entered ID is not registered.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('you cannot sign in ');
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _idFocusNode.removeListener(_onFocusChange);
    _idFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _idFocusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _idFocusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Container(
            padding:
                EdgeInsets.fromLTRB(24 * fem, 7 * fem, 14 * fem, 100 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.fromLTRB(0 * fem, 100 * fem, 1 * fem,
                      _isKeyboardVisible ? 0 : 36.48 * fem),
                  width: _isKeyboardVisible ? 50 * fem : 257.87 * fem,
                  height: _isKeyboardVisible ? 50 * fem : 245.21 * fem,
                  child: Image.asset(
                    'assets/page-1/images/voting-amico-1.png',
                    width: _isKeyboardVisible ? 50 * fem : 257.87 * fem,
                    height: _isKeyboardVisible ? 50 * fem : 245.21 * fem,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 6 * fem),
                              child: Text(
                                'Login',
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
                                maxWidth: 314 * fem,
                              ),
                              child: Text(
                                'Use your id card number to login in to voting application',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xff94a0b4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30 * fem,
                      ),
                      TextFormField(
                        // onChanged: (value) {
                        //   id = value;
                        // },
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter ID',
                          prefixIcon: Icon(Icons.credit_card),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30 * fem,
                      ),
                      TextButton(
                        onPressed: () {
                          _checkID(context);
                          setState(() {
                            _isLoading = false;
                          });
                        },

                        // onPressed: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => TwoStepVerify()));
                        // },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              124 * fem, 14 * fem, 100 * fem, 14 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff3496e0),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child:
                              _isLoading // show SpinKitCircle while data is loading
                                  ? const Center(
                                      child: SpinKitCircle(
                                        color: Colors
                                            .white, // set the color of the loading animation
                                        size:
                                            50.0, // set the size of the loading animation
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 13 * fem, 0 * fem),
                                          child: Text(
                                            'Login',
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/page-1/images/arrow-right.png',
                                          width: 18 * fem,
                                          height: 12 * fem,
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElectionStatus(),
                        ),
                      );
                    },
                    child: Text('Check Current Election Progress'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
