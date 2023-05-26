import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/login-1-.dart';
import 'dart:ui';
import 'package:myapp/page-1/name-of-candidates.dart';
import 'package:myapp/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Elections extends StatefulWidget {
  String name;
  int id;

  Elections({required this.name, required this.id});

  @override
  State<Elections> createState() => _ElectionsState();
}

class _ElectionsState extends State<Elections> {
  bool _isLoading = true;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _ongoingElections = [];

  Future<void> _getOngoingElections() async {
    setState(() {
      _isLoading = true; // set isLoading to true while loading data
    });
    QuerySnapshot snapshot =
        await _firestore.collection('onGoingElection').get();

    setState(() {
      _ongoingElections = snapshot.docs;
      // set isLoading to false after data is loaded
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getOngoingElections();
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pop();
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

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text('Logout'),
              //     style: ButtonStyle(),
              //   ),
              // )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24 * fem, 7 * fem, 24 * fem, 10 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'On Going Elections',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 302 * fem,
                  ),
                  child: Text(
                    'There is the list of on going elections, select one to continue.',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff94a0b4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading // show SpinKitCircle while data is loading
                ? const Center(
                    child: SpinKitCircle(
                      color:
                          Colors.blue, // set the color of the loading animation
                      size: 50.0, // set the size of the loading animation
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    scrollDirection: Axis.vertical,
                    itemCount: _ongoingElections.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = _ongoingElections[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                print('${document['Elections']}');
                                FirebaseFirestore.instance
                                    .collection('votes')
                                    .where('voterId', isEqualTo: widget.id)
                                    .where('currentElection',
                                        isEqualTo: document['Elections'])
                                    .get()
                                    .then((querySnapshot) {
// If there are no documents with the same voterId
                                  if (querySnapshot.docs.isEmpty) {
// Navigate to the other page
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                                  electionName:
                                                      document['Elections'],
                                                  electionId: document.id,
                                                  name: widget.name,
                                                  id: widget.id,
                                                )));
                                  } else {
// If there are documents with the same voterId
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Already Voted in this Election'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                }).catchError((error) {
// Show a SnackBar with an error message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Unexpected Error: $error'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Invalid Code retry'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                print('This is the error $e');
                              }
                            },
                            child: Container(
                              height: 60 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff3496E0),
                                borderRadius: BorderRadius.circular(8 * fem),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30 * fem, 0 * fem, 16 * fem, 0 * fem),
                                    child: Text(
                                      document['Elections'],
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 18 * ffem,
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
                          SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }),
          ),
        ],
      ),
    ));
  }
}
