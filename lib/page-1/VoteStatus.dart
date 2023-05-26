import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class ElectionStatus extends StatefulWidget {
  const ElectionStatus({Key? key}) : super(key: key);

  @override
  State<ElectionStatus> createState() => _ElectionStatusState();
}

class _ElectionStatusState extends State<ElectionStatus> {
  final CollectionReference votesCollection =
      FirebaseFirestore.instance.collection('votes');

  Stream<List<Map<String, dynamic>>> getVoteCountsStream() {
    return votesCollection.snapshots().map((QuerySnapshot snapshot) {
      Map<String, dynamic> voteCounts = {};

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        String candidateName = doc['candidateName'];
        String currentElection = doc['currentElection'];
        if (currentElection != null) {
          if (voteCounts.containsKey(currentElection)) {
            Map<String, int> currentVoteCounts =
                Map<String, int>.from(voteCounts[currentElection]);
            currentVoteCounts[candidateName] =
                (currentVoteCounts[candidateName] ?? 0) + 1;
            voteCounts[currentElection] = currentVoteCounts;
          } else {
            voteCounts[currentElection] = {candidateName: 1};
          }
        }
      }

      List<Map<String, dynamic>> flattenedVoteCounts = [];
      for (String currentElection in voteCounts.keys) {
        Map<String, int> voteCountMap = voteCounts[currentElection]!;
        flattenedVoteCounts.add({
          'currentElection': currentElection,
          'candidates': voteCountMap,
          'totalVotes': voteCountMap.values.reduce((a, b) => a + b),
        });
      }

      return flattenedVoteCounts;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Voting in Progress',
          style: SafeGoogleFont(
            'Poppins',
            fontSize: 20 * ffem,
            fontWeight: FontWeight.w600,
            height: 1.5 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: getVoteCountsStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error  here: ${snapshot.error}'),
                        );
                      } else {
                        List<Map<String, dynamic>> electionDataList =
                            snapshot.data!;

                        return ListView.builder(
                          itemCount: electionDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> electionData =
                                electionDataList[index];
                            String electionName =
                                electionData['currentElection'];
                            int totalVotes = electionData['totalVotes'];

                            Map<String, int> candidateVoteCounts =
                                electionData['candidates'];

                            return Column(
                              children: [
                                Text(
                                  'Election Name: $electionName',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Text(
                                  'Total Votes: $totalVotes',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: candidateVoteCounts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String candidateName = candidateVoteCounts
                                        .keys
                                        .elementAt(index);
                                    int count = candidateVoteCounts.values
                                        .elementAt(index);

                                    return Card(
                                      elevation: 4,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                candidateName,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.5 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              Text(
                                                'Vote Count: $count',
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16 * ffem,
                                                  height: 1.7 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          },
                        );
                      }
                    },
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
