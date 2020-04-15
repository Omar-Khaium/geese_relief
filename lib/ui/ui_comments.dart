import 'package:flutter/material.dart';
import 'package:geese_relief/model/comment.dart';
import 'package:geese_relief/model/customer.dart';
import 'package:geese_relief/model/organized_comments.dart';
import 'package:geese_relief/utils/widget_comment_list_tile.dart';

class CommentsUI extends StatelessWidget {
  final Customer customer;

  CommentsUI(this.customer);

  final List<Comment> comments = [
    Comment("Paving", "04/14/2020 09:30 PM"),
    Comment("Two goslings", "04/12/2020 06:00 PM"),
    Comment(
        "could not get them to leave. Jack would not swim more than 10 ft before turning around.",
        "04/12/2020 11:13 AM"),
    Comment("could not get them to leave, just hiding", "04/12/2020 10:50 AM"),
    Comment("goose does not leave. dog will not swim.", "04/11/2020 09:30 PM"),
    Comment("goose does not leave. dog will not swim.", "04/11/2020 09:29 PM"),
    Comment("4 would not leave, do swam for 20 minutes", "04/10/2020 11:30 PM"),
  ];

  List<OrganizedComments> list = [];

  @override
  Widget build(BuildContext context) {
    organizeCommentAsDate();

    return Scaffold(
      appBar: AppBar(
        title: Text(customer.name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) => CommentItem(list[index]),
        itemCount: list.length,
      ),
    );
  }

  organizeCommentAsDate() {
    for (Comment comment in comments) {
      int index = doesExist(comment);
      if (index == -1) {
        String date = comment.time.split(" ")[0];
        comment.time = comment.time.split(" ")[1] + " " + comment.time.split(" ")[2];
        list.add(new OrganizedComments(date, [comment]));
      } else {
        String date = comment.time.split(" ")[0];
        comment.time = comment.time.split(" ")[1] + " " + comment.time.split(" ")[2];
        list[index].comments.add(comment);
      }
    }
  }

  int doesExist(Comment comment) {
    int counter = 0;
    for (OrganizedComments item in list) {
      if (item.date == comment.time.split(" ")[0]) {
        return counter;
      }
      counter++;
    }
    return -1;
  }
}
