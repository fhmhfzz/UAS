import 'dart:convert';

import 'package:flutter_application_1/soccermodel.dart';
import 'package:http/http.dart';

class SoccerApi {
  final String apiurl =
      "https://v3.football.api-sports.io/fixtures?season=2021&league=39";

  static String api_key = "a71afe16b9498c323768609ffb79a463";

  static const Headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "a71afe16b9498c323768609ffb79a463"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiurl), headers: Headers);
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
  }
}
