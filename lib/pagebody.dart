import 'package:flutter/material.dart';
import 'package:flutter_application_1/goalstat.dart';
import 'package:flutter_application_1/matchtitle.dart';
import 'package:flutter_application_1/teamstat.dart';
import 'soccermodel.dart';

Widget PageBody(List<SoccerMatch> allMatches) {
  return Column(
    children: [
      Expanded(
        flex: 5,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamStat("Local Team", allMatches[0].home.logourl,
                    allMatches[0].home.name),
                goalStat(allMatches[0].fixture.status.elapsedTime,
                    allMatches[0].goal.home, allMatches[0].goal.away),
                teamStat("Visitor Team", allMatches[0].away.logourl,
                    allMatches[0].away.name),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFF4373d9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              )),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: allMatches.length,
                        itemBuilder: (context, index) {
                          return matchTile(allMatches[index]);
                        }))
              ],
            ),
          ),
        ),
      )
    ],
  );
}
