import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui';
import 'package:myapp/page-1/votedSuccess.dart';
import 'package:myapp/utils.dart';

class CandidatesList extends StatefulWidget {
  final String electionName;
  final String electionId;
  String name;
  int id;

  CandidatesList(
      {required this.electionName,
      required this.electionId,
      required this.name,
      required this.id});
  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  String? selectedTileId;
  String? selectedTileName;
  String? selectedTileParty;
  String? voterName;
  bool isSelected = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> _candidatesStream;

  List<DocumentSnapshot> candidates = [];

  @override
  void initState() {
    super.initState();

    _candidatesStream = _firestore
        .collection('onGoingElection')
        .doc(widget.electionId)
        .collection('candidates')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    Map<String, dynamic> voteData = {
      'candidateName': selectedTileName,
      'candidateParty': selectedTileParty,
      'voterId': widget.id,
      'voterName': widget.name,
      'currentElection': widget.electionName,
    };

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
            Container(
              padding:
                  EdgeInsets.fromLTRB(24 * fem, 1 * fem, 24 * fem, 10 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
                    child: Text(
                      '${widget.electionName} Elections',
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
                    'Candidates are listed below',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xff94a0b4),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffBAC3D2),
                    ),
                  ),
                  Text(
                    'Select Candidate',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 6 * fem,
                  ),
                  Text(
                    'Candidate from your area are listed below, \nPlease select one candidate.\nSelected Candidate will appear with a blue tick.',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff94a0b4),
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                ],
              ),
            ),
            Expanded(
                child: false // show SpinKitCircle while data is loading
                    ? const Center(
                        child: SpinKitCircle(
                          color: Colors
                              .blue, // set the color of the loading animation
                          size: 50.0, // set the size of the loading animation
                        ),
                      )
                    : StreamBuilder(
                        stream: _candidatesStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          List<DocumentSnapshot> candidates =
                              snapshot.data!.docs;

                          return ListView.builder(
                              itemCount: candidates.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot document = candidates[index];
                                String name = document['Name'];
                                String party = document['Party'];
                                return ListTile(
                                  selected: document.id == selectedTileId,
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      selectedTileId = document.id;
                                      selectedTileName = name;
                                      selectedTileParty = party;
                                      print(selectedTileId);
                                      print(selectedTileName);
                                    });
                                  },
                                  leading: const CircleAvatar(
                                    radius: 25,
                                  ),
                                  trailing: const Icon(
                                    Icons.check_box_outlined,
                                    size: 25,
                                  ),
                                  title: Text(
                                    name,
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  subtitle: Text(
                                    party,
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff5a667a),
                                    ),
                                  ),
                                );
                              });
                        })),
            Padding(
              padding: EdgeInsets.only(left: 30 * fem, right: 30 * fem),
              child: ElevatedButton(
                onPressed: () {
                  if (selectedTileId != null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext) {
                          return Dialog(
                            backgroundColor: const Color(757575),
                            child: Container(
                              height: 355,
                              width: 327,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            width: 20 * fem,
                                            height: 20 * fem,
                                            child: Image.asset(
                                              'assets/page-1/images/close-square.png',
                                              width: 20 * fem,
                                              height: 20 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // padding: EdgeInsets.fromLTRB(40 * fem,
                                          //     55 * fem, 40 * fem, 14 * fem),
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
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        const CircleAvatar(
                                          radius: 35,
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Text(
                                          '$selectedTileName',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10 * fem,
                                        ),
                                        Text(
                                          '$selectedTileParty',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20 * fem,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            FirebaseFirestore.instance
                                                .collection('votes')
                                                .where('voterId',
                                                    isEqualTo: widget.id)
                                                .where('electionName',
                                                    isEqualTo:
                                                        widget.electionName)
                                                .get()
                                                .then((querySnapshot) {
                                              // If there are no documents with the same voterId, add the new voteData document
                                              if (querySnapshot.docs.isEmpty) {
                                                FirebaseFirestore.instance
                                                    .collection('votes')
                                                    .add(voteData)
                                                    .then((value) {
                                                  // Navigate to the other page after the vote is added
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Voted(
                                                            ElectionName: widget
                                                                .electionName,
                                                            name: widget.name,
                                                            id: widget.id)),
                                                  );
                                                }).catchError((error) {
                                                  // Show a SnackBar with an error message
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Failed to add vote: $error'),
                                                      duration:
                                                          Duration(seconds: 3),
                                                    ),
                                                  );
                                                });
                                              } else {
                                                // If there are documents with the same voterId, show an error message
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'A vote from this voter already exists.'),
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ),
                                                );
                                              }
                                            }).catchError((error) {
                                              // Show a SnackBar with an error message
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text('Failed : $error'),
                                                  duration:
                                                      Duration(seconds: 3),
                                                ),
                                              );
                                            });

                                            // FirebaseFirestore.instance
                                            //     .collection('votes')
                                            //     .add(voteData)
                                            //     .then((value) {
                                            //   print('Vote added');
                                            //   Navigator.of(context).push(
                                            //       MaterialPageRoute(
                                            //           builder: (context) =>
                                            //               Voted()));
                                            // }).catchError((error) {
                                            //   // Show a SnackBar with an error message
                                            //   ScaffoldMessenger.of(context)
                                            //       .showSnackBar(
                                            //     SnackBar(
                                            //       content: Text(
                                            //           'Failed to add vote: $error'),
                                            //       duration:
                                            //           Duration(seconds: 3),
                                            //     ),
                                            //   );
                                            // });
                                          },
                                          child: Container(
                                            width: 261,
                                            height: 52,
                                            padding: const EdgeInsets.only(
                                              left: 70,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xff3496e0),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8 * fem),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Cast Vote',
                                                      style: SafeGoogleFont(
                                                        'Poppins',
                                                        fontSize: 16 * ffem,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height:
                                                            1.5 * ffem / fem,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
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
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    // show an error message if no Candidate is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a Candidate.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(327 * fem, 60 * fem),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  primary: Color(0xff3496e0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Confirm',
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 8.0),
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
    );
  }
}
