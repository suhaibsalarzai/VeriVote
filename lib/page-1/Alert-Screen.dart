import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class VerifyVote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // stepverificationfup (3:540)
        width: double.infinity,
        height: 812 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // statusbarxP8 (3:541)
              left: 24 * fem,
              top: 7.0014343262 * fem,
              child: Container(
                width: 327 * fem,
                height: 25.5 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // leftsideqxi (I3:541;801:42)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 4.5 * fem, 206.34 * fem, 0 * fem),
                      width: 54 * fem,
                      height: 21 * fem,
                      child: Image.asset(
                        'assets/page-1/images/left-side-KHp.png',
                        width: 54 * fem,
                        height: 21 * fem,
                      ),
                    ),
                    Container(
                      // rightsideAVC (I3:541;801:45)
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // autogroupqsirWox (NCtEm8XzbFWPGD6MiJqSir)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 5.03 * fem, 0.33 * fem),
                            width: 17 * fem,
                            height: 20.33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/auto-group-qsir.png',
                              width: 17 * fem,
                              height: 20.33 * fem,
                            ),
                          ),
                          Container(
                            // wifi1ki (I3:541;801:50)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 5.03 * fem, 0.37 * fem),
                            width: 15.27 * fem,
                            height: 10.97 * fem,
                            child: Image.asset(
                              'assets/page-1/images/wifi.png',
                              width: 15.27 * fem,
                              height: 10.97 * fem,
                            ),
                          ),
                          Container(
                            // batteryLHC (I3:541;801:46)
                            width: 24.33 * fem,
                            height: 11.33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/battery-eHk.png',
                              width: 24.33 * fem,
                              height: 11.33 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // statusbarTsc (3:542)
              left: 24 * fem,
              top: 7.0014343262 * fem,
              child: Container(
                width: 327 * fem,
                height: 25.5 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // leftsideC4W (I3:542;801:42)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 4.5 * fem, 206.34 * fem, 0 * fem),
                      width: 54 * fem,
                      height: 21 * fem,
                      child: Image.asset(
                        'assets/page-1/images/left-side-pnr.png',
                        width: 54 * fem,
                        height: 21 * fem,
                      ),
                    ),
                    Container(
                      // rightsideti2 (I3:542;801:45)
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // autogroupyy1cEWz (NCtEwNjvVhBMEzMzGEYY1C)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 5.03 * fem, 0.33 * fem),
                            width: 17 * fem,
                            height: 20.33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/auto-group-yy1c.png',
                              width: 17 * fem,
                              height: 20.33 * fem,
                            ),
                          ),
                          Container(
                            // wifiY1t (I3:542;801:50)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 5.03 * fem, 0.37 * fem),
                            width: 15.27 * fem,
                            height: 10.97 * fem,
                            child: Image.asset(
                              'assets/page-1/images/wifi-HKt.png',
                              width: 15.27 * fem,
                              height: 10.97 * fem,
                            ),
                          ),
                          Container(
                            // battery4kv (I3:542;801:46)
                            width: 24.33 * fem,
                            height: 11.33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/battery.png',
                              width: 24.33 * fem,
                              height: 11.33 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // arrowleft2BqY (3:543)
              left: 31 * fem,
              top: 70 * fem,
              child: Align(
                child: SizedBox(
                  width: 10 * fem,
                  height: 12 * fem,
                  child: Image.asset(
                    'assets/page-1/images/arrow-left-2-QrJ.png',
                    width: 10 * fem,
                    height: 12 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // frame2125vv (3:547)
              left: 24 * fem,
              top: 104 * fem,
              child: Container(
                width: 327 * fem,
                height: 185 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // frame211RE6 (3:548)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 16 * fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // nationalelectionsASa (3:549)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 6 * fem),
                            child: Text(
                              'National Elections',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff75a242),
                              ),
                            ),
                          ),
                          Text(
                            // candidatesarelistedbelowq2v (3:550)
                            'Candidates are listed below',
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff94a0b4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // line1xtE (3:551)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 15 * fem),
                      width: double.infinity,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xffb9c2d2),
                      ),
                    ),
                    Container(
                      // frame199WPx (3:552)
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // selectcandidatesVQ (3:553)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 6 * fem),
                            child: Text(
                              'Select Candidate',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // candidatefromyourareaarelisted (3:554)
                            constraints: BoxConstraints(
                              maxWidth: 311 * fem,
                            ),
                            child: Text(
                              'Candidate from your area are listed below, \nPlease select one candidate.\nSelected Candidate will appear with the tick.',
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
                  ],
                ),
              ),
            ),
            Positioned(
              // frame215FVx (3:555)
              left: 24 * fem,
              top: 322 * fem,
              child: Container(
                width: 327 * fem,
                height: 505 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // frame213ZWe (3:556)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 13 * fem, 42 * fem, 13 * fem),
                      width: double.infinity,
                      height: 85 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffb9c2d2)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse1UNi (3:557)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 13 * fem, 0 * fem),
                            width: 59 * fem,
                            height: 59 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.5 * fem),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          Container(
                            // frame214oQz (3:558)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 5 * fem, 0 * fem, 5 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // aliusmanVYi (3:559)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                  child: Text(
                                    'Ali Usman',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // pakistantehreekinsaafpticdL (3:560)
                                  'Pakistan Tehreek Insaaf (PTI)',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff5a667a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    Container(
                      // frame214Wii (3:561)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 13 * fem, 14.33 * fem, 13 * fem),
                      width: double.infinity,
                      height: 85 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3496e0)),
                        color: Color(0xffddf0ff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse1cmk (3:562)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 13 * fem, 0 * fem),
                            width: 59 * fem,
                            height: 59 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.5 * fem),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          Container(
                            // frame214A2a (3:563)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 5 * fem, 4.33 * fem, 5 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // aliusmanVqY (3:564)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                  child: Text(
                                    'Ali Usman',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // pakistantehreekinsaafptidRx (3:565)
                                  'Pakistan Tehreek Insaaf (PTI)',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff5a667a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // ticksquaremo4 (3:566)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 33 * fem),
                            width: 23.33 * fem,
                            height: 23.33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/tick-square-MKt.png',
                              width: 23.33 * fem,
                              height: 23.33 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    Container(
                      // frame215SPQ (3:570)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 13 * fem, 42 * fem, 13 * fem),
                      width: double.infinity,
                      height: 85 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffb9c2d2)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse1wqx (3:571)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 13 * fem, 0 * fem),
                            width: 59 * fem,
                            height: 59 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.5 * fem),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          Container(
                            // frame214tFQ (3:572)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 5 * fem, 0 * fem, 5 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // aliusman2cW (3:573)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                  child: Text(
                                    'Ali Usman',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // pakistantehreekinsaafptixWA (3:574)
                                  'Pakistan Tehreek Insaaf (PTI)',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff5a667a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    Container(
                      // frame216tei (3:575)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 13 * fem, 42 * fem, 13 * fem),
                      width: double.infinity,
                      height: 85 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffb9c2d2)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse1myQ (3:576)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 13 * fem, 0 * fem),
                            width: 59 * fem,
                            height: 59 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.5 * fem),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          Container(
                            // frame214JiS (3:577)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 5 * fem, 0 * fem, 5 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // aliusmanSJr (3:578)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                  child: Text(
                                    'Ali Usman',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // pakistantehreekinsaafptixY6 (3:579)
                                  'Pakistan Tehreek Insaaf (PTI)',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff5a667a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    Container(
                      // frame217efp (3:580)
                      padding: EdgeInsets.fromLTRB(
                          12 * fem, 13 * fem, 42 * fem, 13 * fem),
                      width: double.infinity,
                      height: 85 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffb9c2d2)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(8 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse1Nbp (3:581)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 13 * fem, 0 * fem),
                            width: 59 * fem,
                            height: 59 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.5 * fem),
                              color: Color(0xffd9d9d9),
                            ),
                          ),
                          Container(
                            // frame214VRY (3:582)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 5 * fem, 0 * fem, 5 * fem),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // aliusmanqEW (3:583)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                  child: Text(
                                    'Ali Usman',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // pakistantehreekinsaafptiZwC (3:584)
                                  'Pakistan Tehreek Insaaf (PTI)',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff5a667a),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // frame219WrS (3:585)
              left: 0 * fem,
              top: 726 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(25 * fem, 17 * fem, 23 * fem, 17 * fem),
                width: 375 * fem,
                height: 86 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      offset: Offset(0 * fem, -4 * fem),
                      blurRadius: 6 * fem,
                    ),
                  ],
                ),
                child: Container(
                  // frame218CDU (3:586)
                  padding: EdgeInsets.fromLTRB(
                      113 * fem, 14 * fem, 116 * fem, 14 * fem),
                  width: double.infinity,
                  height: double.infinity,
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
                        // confirmsKc (3:587)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 13 * fem, 0 * fem),
                        child: Text(
                          'Confirm',
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
                        // arrowrightk8W (3:588)
                        width: 18 * fem,
                        height: 12 * fem,
                        child: Image.asset(
                          'assets/page-1/images/arrow-right-Dti.png',
                          width: 18 * fem,
                          height: 12 * fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle2255ga (3:630)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 375 * fem,
                  height: 812 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x7f000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // frame220cAi (3:665)
              left: 24 * fem,
              top: 238 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(33 * fem, 18 * fem, 23 * fem, 39 * fem),
                width: 327 * fem,
                height: 355 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(8 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // closesquareWmt (3:678)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 17 * fem),
                      width: 20 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/page-1/images/close-square.png',
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    Container(
                      // frame2221ie (3:666)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
                      width: 261 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupv1swkRL (NCtFnw9gLjEXGdocYyv1SW)
                            padding: EdgeInsets.fromLTRB(
                                16 * fem, 0 * fem, 16 * fem, 30 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // kindlyconfirmyourvoteU6S (3:667)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 30 * fem),
                                  child: Text(
                                    'Kindly Confirm your Vote',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // frame221NSi (3:668)
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // ellipse1jHG (3:669)
                                        margin: EdgeInsets.fromLTRB(85 * fem,
                                            0 * fem, 85 * fem, 0 * fem),
                                        width: double.infinity,
                                        height: 59 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(29.5 * fem),
                                          color: Color(0xffd9d9d9),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9 * fem,
                                      ),
                                      Text(
                                        // aliusmanrMt (3:670)
                                        'Ali Usman',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 9 * fem,
                                      ),
                                      Text(
                                        // pakistantehreekinsaafptiCAr (3:671)
                                        'Pakistan Tehreek Insaaf (PTI)',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: Color(0xff707e94),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // frame21884W (3:672)
                            padding: EdgeInsets.fromLTRB(
                                73.5 * fem, 14 * fem, 76.5 * fem, 14 * fem),
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
                                  // castvote2va (3:673)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 13 * fem, 0 * fem),
                                  child: Text(
                                    'Cast Vote',
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
                                  // arrowrightY8E (3:674)
                                  width: 18 * fem,
                                  height: 12 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/arrow-right-TzE.png',
                                    width: 18 * fem,
                                    height: 12 * fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
