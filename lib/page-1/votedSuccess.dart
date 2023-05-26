import 'package:flutter/material.dart';
import 'package:myapp/page-1/on-going-elections.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:lottie/lottie.dart';

class Voted extends StatefulWidget {
  late String ElectionName;
  late String name;
  late int id;
  Voted({required this.ElectionName, required this.name, required this.id});

  @override
  State<Voted> createState() => _VotedState();
}

class _VotedState extends State<Voted> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('animations/success-animation.json',
                  height: 300, width: 320, fit: BoxFit.cover, repeat: false),
              Text(
                'Vote Casted Successfully!',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff3496e0),
                ),
              ),
              Text(
                'You have successfully casted your ',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff94a0b4),
                ),
              ),
              Text(
                '${widget.ElectionName} Assembly Vote',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff283244),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Elections(name: widget.name, id: widget.id),
                      ),
                    );
                  },
                  child: Text('Go Back to Home'))
            ],
          ),
        ),
      ),
    );
  }
}
