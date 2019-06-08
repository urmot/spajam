import 'package:flutter/material.dart';
import 'package:spajam/ui/page/member_list/member_card.dart';

class MemerListPage extends StatelessWidget {
  Size deviceSize;

  final String image;

  MemerListPage({this.image, Key key}) : super(key: key);

  Widget body(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            providerCard(
              this.image,
              'yuta muramoto',
              '09000000000',
              true,
              '12',
              false,
              true,
              false,
            ),
            providerCard(
              this.image,
              'takeo kusama',
              '09000000000',
              true,
              '34',
              false,
              false,
              false,
            ),
            providerCard(
              this.image,
              'takahiro motoyama',
              '09000000000',
              true,
              '80',
              true,
              true,
              false,
            ),
            providerCard(
              this.image,
              '09000000000',
              'takuto kusakabe',
              true,
              '88',
              true,
              true,
              true,
            ),
            providerCard(
              this.image,
              'keisuke taniai',
              '09000000000',
              false,
              '',
              false,
              false,
              false,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: <Widget>[
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: body(context),
      ),
    ]);
  }
}
