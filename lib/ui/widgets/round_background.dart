import 'package:flutter/material.dart';
import 'package:spajam/ui/tools/arc_clipper.dart';
import 'package:spajam/utils/uidata.dart';

class RoundBackground extends StatelessWidget {
  final backgroundColor;
  final image;
  RoundBackground({this.backgroundColor, this.image});

  Widget topHalf(BuildContext context) {
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: UIData.kitGradients,
              )),
            ),
            new Container(
                width: double.infinity,
                child: image != null
                    ? Image.network(
                        image,
                        fit: BoxFit.cover,
                      )
                    : new Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          color: backgroundColor,
        ),
        new Column(
          children: <Widget>[
            topHalf(context),
            bottomHalf,
          ],
        ),
      ],
    );
  }
}
