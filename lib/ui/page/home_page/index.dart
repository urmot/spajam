import 'package:flutter/material.dart';
import 'package:spajam/ui/widgets/helper.dart';

Widget countdownCard() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "旅行まであと",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        space(width: 8),
        Text(
          "2",
          style: TextStyle(
            color: Colors.green,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "日",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        space(width: 8),
        Text(
          "8:02",
          style: TextStyle(
            color: Colors.green,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "！！",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

Widget storyMembersCard(Size deviceSize) => SizedBox(
      height: deviceSize.height / 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                        splashColor: Colors.yellow,
                        onTap: () => {},
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: deviceSize.width / 4,
                              height: deviceSize.width / 4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                            'https://ca.slack-edge.com/T7KQHUNQ3-U7M0T2A3H-9db160da4099-72')
                                        .image,
                                  )),
                            ),
                            space(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "19.7",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                space(width: 4),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  )),
        ),
      ),
    );

Widget projectOverviewCard() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "深センに行く",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "期間：6月8日〜6月9日",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                "集合場所：東京都中央区築地1-13-1 銀座松竹スクエア11F",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                "集合時間：09:00",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              space(height: 4),
              Text(
                "メモ：\n当日の持ち物\nお金\nスマホ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )));
