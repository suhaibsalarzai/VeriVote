import 'package:flutter/material.dart';

import '../utils.dart';

class ElectionStatus extends StatefulWidget {
  const ElectionStatus({Key? key}) : super(key: key);

  @override
  State<ElectionStatus> createState() => _ElectionStatusState();
}

class _ElectionStatusState extends State<ElectionStatus> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Voting in Progress',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Below is the stats of on Going Elections ',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff94a0b4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
