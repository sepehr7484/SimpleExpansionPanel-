import 'dart:math';

import 'package:expansionpanel/tools.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int redcolor;
  late int greencolor;
  late int bluecolor;
  List<bool> _isExpanded = List.generate(4, (_) => false);
  List<String> groupname = ['ورزشی', 'حوادث', 'اقتصادی', 'سیاسی'];
  //late int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    redcolor = Random().nextInt(255);
    greencolor = Random().nextInt(150);
    bluecolor = Random().nextInt(80);
    print(redcolor + greencolor + bluecolor);
    for (int i = 0; i < groupname.length; i++) {
      print(groupname[i]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('خبرها'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: [
                ExpansionPanelList(
                  dividerColor:
                      Color.fromARGB(150, redcolor, greencolor, bluecolor),
                  elevation: 1,
                  animationDuration: Duration(seconds: 1),
                  expansionCallback: (index, isExpanded) => setState(() {
                    _isExpanded[index] = !isExpanded;
                  }),
                  children: [
                    for (int i = 0; i < groupname.length; i++)
                      ExpansionPanel(
                        backgroundColor:
                            Color.fromARGB(70, redcolor, greencolor, bluecolor),
                        body: ListTile(subtitle: Text(discription[i])),
                        headerBuilder: (_, isExpanded) {
                          return Center(
                            child: Text(groupname[i]),
                          );
                        },
                        isExpanded: _isExpanded[i],
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
