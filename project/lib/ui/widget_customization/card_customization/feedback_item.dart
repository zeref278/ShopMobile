import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/models/feedback.dart';

class FeedbackItem extends StatelessWidget {

  final FeedbackModel feedback;

  FeedbackItem({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(feedback.user.avatarPath),
                ),
                SizedBox(width: 5,),
                Text(feedback.user.userName, overflow: TextOverflow.ellipsis,),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar(
                  allowHalfRating: true,
                  initialRating: feedback.rating,
                  itemSize: 20,
                  ignoreGestures: true,
                  onRatingUpdate: (double value) {},
                  ratingWidget: RatingWidget(
                    full: Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.amber,
                    ),
                    half: Icon(CupertinoIcons.star_lefthalf_fill,
                        color: Colors.amber),
                    empty: Icon(CupertinoIcons.star_fill,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.clock, size: 11,),
                    SizedBox(width: 2,),
                    Text(feedback.time, style: TextStyle(fontSize: 11),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text(feedback.comment),
          ],
        ),
      ),
    );
  }

}