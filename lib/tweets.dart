import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';

class Tweets extends StatefulWidget {
  const Tweets({Key? key}) : super(key: key);

  @override
  _TweetsState createState() => _TweetsState();
}

class _TweetsState extends State<Tweets> {
  //String userName = "";
  String tweet1 = "";
  String tweet2 = "";
  String tweet3 = "";
  String tweet4 = "";
  String tweet5 = "";

  Future gettweet(String userapi) async {
    /*var BEARERTOKEN =
        "AAAAAAAAAAAAAAAAAAAAAIp0VwEAAAAA0lOq1ON2WsdwkkDjb2znmd2Pl5w%3DM4YxHq1b2eGysXZhc0VTCsSFYXWzn0H6OK1DYmXEpNCWVJJxn6";*/
    print(userapi);
    var url = Uri.parse("https://api.twitter.com/2/users/by/username/$userapi");
    /*var url3 = url.toString().substring(0, 44) +
        url.toString().substring(47, url.toString().length);
    var url4 = Uri.parse(url3);*/
    print(url);
    var token =
        "AAAAAAAAAAAAAAAAAAAAAIp0VwEAAAAApcNKekxZg3V%2FiX5OzxQ1zl4LyXc%3DYQqoOo6BrtU3UQcsHr41B6syFOtZUdtHBHEoLYR1JqAa9JEeFC";
    http.Response response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*",
    });
    var results = json.decode(response.body);
    print("results - $results");
    var id = (results['data']['id']).toString();
    var url2 = Uri.parse("https://api.twitter.com/2/users/$id/tweets");
    print("id $id");
    http.Response response2 = await http.get(url2, headers: {
      'Authorization': 'Bearer $token',
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    var results2 = json.decode(response2.body);
    print(results2);
    setState(() {
      tweet1 = (results2['data'][0]['text']).toString();
      tweet2 = (results2['data'][1]['text']).toString();
      tweet3 = (results2['data'][2]['text']).toString();
      tweet4 = (results2['data'][3]['text']).toString();
      tweet5 = (results2['data'][4]['text']).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String username = ModalRoute.of(context)!.settings.arguments.toString();
    var str1 = username.substring(10, username.length - 1);
    var str2 = str1.substring(1, str1.length);
    print(str2);
    gettweet(str2);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Recent Tweets'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      title: Text(
                        "$tweet1",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      title: Text(
                        "$tweet2",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      title: Text(
                        "$tweet3",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      title: Text(
                        "$tweet4",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      title: Text(
                        "$tweet5",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
