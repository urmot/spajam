import 'package:flutter/material.dart';
import 'package:spajam/ui/page/member_list/member_card.dart';
import 'package:spajam/utils/uidata.dart';

class MemerListPage extends StatelessWidget {
  Size deviceSize;

  final String image;

  MemerListPage({this.image, Key key}) : super(key: key);

  Widget body(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            providerCard(
              'https://pbs.twimg.com/profile_images/1049500623828267009/CbNpGA1Z_400x400.jpg',
              'docbase',
              this.image,
              'myoujito.namaedayo',
              '',
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
