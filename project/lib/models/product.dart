import 'package:project/models/feedback.dart';

class Product {
  //Attribute
  //int numberSold;
  String name;
  String category;
  int price;
  String picturePath;
  int? oldPrice;
  List<String> storageAvailable;
  bool isFavorite;
  List<FeedbackModel> feedbacks;

  // To create dynamic price from options
  var bonusMap;

  List<String> colorAvailable;
  int quantityRemaining;
  String shortDescription;


  int getDiscount()
  {
    return (((oldPrice! - price)*100) / oldPrice!).ceil() ;
  }

  int calcPrice(String newStorage, String newColor) {
    return price +
        int.parse(bonusMap[newStorage]) +
        int.parse(bonusMap[newColor]);
  }

  int calcOldPrice(String newStorage, String newColor) {
    return oldPrice! +
        int.parse(bonusMap[newStorage]) +
        int.parse(bonusMap[newColor]);
  }

  double getRating() {
    double totalStars = 0;
    int count = 0;
    feedbacks.forEach((feedback) {
      totalStars += feedback.rating;
      count++;
    });
    return count == 0 ? 0 : totalStars / count;
  }

  //Constructor
  Product(
      {//required this.numberSold,
      required this.feedbacks,
      required this.isFavorite,
      required this.name,
      required this.price,
      required this.category,
      required this.picturePath,
      required this.colorAvailable,
      required this.storageAvailable,
      required this.quantityRemaining,
      required this.shortDescription,
      required this.bonusMap,
      this.oldPrice});
}
