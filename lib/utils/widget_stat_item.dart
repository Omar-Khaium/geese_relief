import 'package:flutter/material.dart';
import 'package:geese_relief/utils/widget_badge.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final double progress;

  StatItem(this.icon, this.title, this.count, this.progress);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
              child: QuickMenuBadge(
                icon: icon,
                count: count,
              )),
        ),

        SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.black87),
                        textAlign: TextAlign.left,
                      )),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8), ),
                child: Container(
                  height: 4,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey.shade200,
                    value: progress,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
