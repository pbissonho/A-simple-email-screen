import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 470.h),
              EmailListView(),
            ],
          ),
          CustomAppBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(),
          )
        ],
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(43)),
      child: Container(
        height: 200.h,
        color: Theme.of(context).bottomAppBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidStar,
              size: 50.h * (10.h * 0.5),
            ),
            Icon(
              FontAwesomeIcons.userFriends,
              size: 50.h * (10.h * 0.5),
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.mailBulk,
              size: 50.h * (10.h * 0.5),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(43)),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(43))),
        height: 500.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Inbox",
                    style: TextStyle(
                        fontSize: 120.h,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    FontAwesomeIcons.search,
                    size: 35,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      EmailIcon(
                        source: "assets/images/gmail.png",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      EmailIcon(
                        source: "assets/images/outlook.png",
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/images/icon.svg',
                      width: 27, height: 27, semanticsLabel: 'A red up arrow')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailIcon extends StatelessWidget {
  final String source;

  const EmailIcon({Key key, this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: emailIconBackgroundColor),
            width: 40,
            height: 40,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
            child: Image.asset(
              source,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      ClampingScrollPhysics();

  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}

class EmailListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 1252.h,
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            EmailCard(
              imageUrl:
                  'https://image.freepik.com/fotos-gratis/mulher-jovem-posar-mantendo-maos-perto_23-2148222691.jpg',
            ),
            EmailCard(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2015/09/02/13/24/girl-919048_960_720.jpg',
            ),
            EmailCard(
              imageUrl:
                  'https://as1.ftcdn.net/jpg/03/14/66/00/500_F_314660048_QUbPb72BNkTVUh11Jcjz8U9sh62hBbuS.jpg',
            ),
            EmailCard(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2016/08/05/02/14/gum-1571460_960_720.jpg',
            ),
            EmailCard(
              imageUrl:
                  'https://image.freepik.com/fotos-gratis/jovem-mulher-em-um-lindo-vestido_1303-17512.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class EmailCard extends StatelessWidget {
  final String imageUrl;

  const EmailCard({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //  color: Colors.red,
        height: 350.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Avatar(
              imageUrl: imageUrl,
            ),
            EmailCardDescrition()
          ],
        ));
  }
}

class EmailCardDescrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("Marke Amarrilo",
                style: TextStyle(color: Colors.white, fontSize: 80.w)),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "19 min ago",
                style: TextStyle(color: textCardSecondaryColor, fontSize: 40.w),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 6),
          child: Text(
            "RE: Design feedback",
            style: TextStyle(
                color: textCardColor,
                fontWeight: FontWeight.bold,
                fontSize: 13.w * 13.h),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Text("One thing is clear to me, and tha",
              style: TextStyle(color: textCardSecondaryColor, fontSize: 50.w)),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final String imageUrl;

  const Avatar({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.h * 8.w),
      child: Container(
        height: 100.h * 25.w * 0.2,
        width: 100.h * 25.w * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.h * 8.w),
          color: Colors.red,
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
