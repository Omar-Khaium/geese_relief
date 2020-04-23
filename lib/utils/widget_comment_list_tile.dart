import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:geese_relief/model/comment.dart';
import 'package:geese_relief/model/organized_comments.dart';

class CommentItem extends StatelessWidget {
  final OrganizedComments item;

  CommentItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, right: 16, left: 64),
      child: Bubble(
        nip: BubbleNip.leftTop,
        padding: BubbleEdges.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.date,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  Comment comment = item.comments[index];
                  return ListTile(
                    title: Text(
                      comment.comment,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.black),
                    ),
                    subtitle: Text(
                      comment.time,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                },
                itemCount: item.comments.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
