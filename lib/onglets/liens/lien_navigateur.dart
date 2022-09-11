// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LienNavigateur extends StatefulWidget {
  final String url;
  final String lien;
  const LienNavigateur({Key? key, required this.url, required this.lien})
      : super(key: key);

  @override
  _LienNavigateurState createState() => _LienNavigateurState();
}

class _LienNavigateurState extends State<LienNavigateur> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    //const String toLaunch = 'https://www.uphf.fr/';
    /*return  ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(2.0),
                //child: Text(toLaunch),
              ),*/
    return Container(
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () => setState(() {
          _launchInBrowser(widget.url);
        }),
        child: Text(
          widget.lien,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      /* ],
          ),
        ],*/
    );
  }
}
/* */

