import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:spajam/ui/widgets/helper.dart';

Widget providerCard(
  String providerImage,
  String memberImage,
  String memberName,
  String memberSubName,
  IconData singInIcon,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              singInIcon,
                            ),
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0, 4.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(memberImage).image,
                                )),
                          ),
                          space(width: 16),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  memberName,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                space(height: 8),
                                Text(
                                  memberSubName,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    size: 21.0,
                    color: Colors.grey,
                  ),
                )
              ],
            )),
      ),
    );
