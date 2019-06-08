import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spajam/ui/page/profile_page/index.dart';
import 'package:spajam/ui/widgets/round_background.dart';
import 'package:spajam/ui/widgets/helper.dart';
import 'package:spajam/utils/uidata.dart';

class MemerListPage extends StatelessWidget {
  Size deviceSize;

  final String image;

  MemerListPage({this.image, Key key}) : super(key: key);

  Widget bottomBar(BuildContext context) => BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Ink(
          height: 50.0,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: UIData.kitGradients)),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                child: new InkWell(
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  onTap: () {},
                  child: Center(
                    child: new Text(
                      "Left Button",
                      style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: 20.0,
              ),
              SizedBox(
                height: double.infinity,
                child: new InkWell(
                  onTap: () {},
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  child: Center(
                    child: new Text(
                      "Right Button",
                      style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget body(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            space(height: deviceSize.height / 4),
            baseInfoCard(),
            space(height: 16),
            providerCard(
              'https://lh3.ggpht.com/8-N_qLXgV-eNDQINqTR-Pzu5Y8DuH0Xjz53zoWq_IcBNpcxDL_gK4uS_MvXH00yN6nd4=s180-rw',
              'gmail',
              this.image,
              '苗字都 名前那世',
              'myoujito.namaedayo@leverages.jp',
            ),
            providerCard(
              'https://www.heapjet.com/wp-content/uploads/thumbs_dir/slack-new-logo-1uxw809vkbzqmnzaf8pxn6acl7do3zjl00jm0n0r6evw.png',
              'slack',
              this.image,
              '苗字都 名前那世',
              '@mension-meidayo',
            ),
            providerCard(
              'https://pbs.twimg.com/profile_images/1049500623828267009/CbNpGA1Z_400x400.jpg',
              'docbase',
              this.image,
              'myoujito.namaedayo',
              '',
            ),
            space(height: deviceSize.height / 6),
          ],
        ),
      );

  void _showModalBottomSheet(BuildContext context, List<String> expirations) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(// @todo 丸くした背景白いので一旦外す
                  // topLeft: new Radius.circular(15.0),
                  // topRight: new Radius.circular(15.0)
                  ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                header(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: expirations.length,
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListTile(
                              title: Text(
                                expirations[i],
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.pushNamed(
                                //   context,
                                //   "/${expirations[i]}"
                                // );
                              }),
                        ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget header() => Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: Image.network(this.image).image,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileTile(
                  title: "苗字都 名前那世",
                  subtitle: "myoujito.namaedayo@leverages.jp",
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: <Widget>[
      RoundBackground(
        backgroundColor: Colors.white.withOpacity(0.98),
        image: this.image,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: body(context),
        floatingActionButton: CustomFloat(
          // builder: Text(
          //   "5",
          //   style: TextStyle(color: Colors.white, fontSize: 10.0),
          // ),
          icon: FontAwesomeIcons.plus,
          qrCallback: () =>
              _showModalBottomSheet(context, ['a week', '3 days', '1 day']),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomBar(context),
      ),
    ]);
  }
}

class CustomFloat extends StatelessWidget {
  final IconData icon;
  final Widget builder;
  final VoidCallback qrCallback;
  final isMini;

  CustomFloat({this.icon, this.builder, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: UIData.kitGradients)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            builder != null
                ? Positioned(
                    right: 7.0,
                    top: 7.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: builder,
                      radius: 10.0,
                    ),
                  )
                : Container(),
            // builder
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;
  ProfileTile({this.title, this.subtitle, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}
