import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:spajam/ui/widgets/helper.dart';

Widget providerCard(
  String memberImage,
  String memberName,
  String memberNumber,
  bool isActive,
  String participationRate,
  bool isParticipation,
  bool isActiveHealth,
  bool isActiveMap,
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
                              isActive
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
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
                                  memberNumber,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 16.0, 0, 4.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.tag_faces,
                                        size: 21,
                                        color: isActiveHealth
                                            ? Colors.green
                                            : Colors.grey,
                                      )
                                    ]),
                                space(width: 16),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Health',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: isActiveHealth
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 16.0, 0, 4.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.map,
                                        size: 21,
                                        color: isActiveMap
                                            ? Colors.green
                                            : Colors.grey,
                                      )
                                    ]),
                                space(width: 16),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Map',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: isActiveMap
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      participationRate + '%',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: isParticipation ? Colors.grey : Colors.red,
                      ),
                    ))
              ],
            )),
      ),
    );
