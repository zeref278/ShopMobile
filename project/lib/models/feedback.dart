import 'package:project/models/user.dart';

class FeedbackModel {
  String time;
  User user;
  double rating;
  String comment;

  FeedbackModel({required this.user, required this.rating, required this.comment, required this.time});
}
