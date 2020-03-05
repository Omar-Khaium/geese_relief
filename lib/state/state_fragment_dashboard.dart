import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardFragmentState extends StatefulWidget {
  @override
  _DashboardFragmentStateState createState() => _DashboardFragmentStateState();
}

class _DashboardFragmentStateState extends State<DashboardFragmentState> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      right: true,
      left: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Color(0xFFECEEF8),
        body: ListView(
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: <Widget>[
            GridView.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 4 / 3,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Colors.white30,
                          )
                        ]),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Colors.white30,
                            )
                          ]),
                      currentAccountPicture: Icon(MdiIcons.accountBadge, color: Colors.blue),
                      accountName: Text("Open Customers", style: Theme.of(context).textTheme.caption.copyWith(color: Colors.blue),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.black12.withOpacity(.075),
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.fileTree, color: Colors.blue.shade400),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "সামগ্রিক প্রশ্ন",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue.shade400, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.black12.withOpacity(.075),
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.cloudQuestion,
                              color: Colors.blue.shade400),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "প্রশ্ন ব্যাংক",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue.shade400, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.black12.withOpacity(.075),
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.library, color: Colors.blue.shade400),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "অনুশীলন",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue.shade400, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.black12.withOpacity(.075),
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.file, color: Colors.blue.shade400),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "কুইজ কুইজ",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue.shade400, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 2,
                            color: Colors.black12.withOpacity(.075),
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MdiIcons.clipboardCheckOutline,
                            color: Colors.blue.shade400,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "মার্ক করা প্রশ্ন",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.blue.shade400, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
