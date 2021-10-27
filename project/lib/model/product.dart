class Product {
  //Attribute
  String name;
  String category;
  int price;
  String picturePath;
  int? oldPrice;
  List<String> storageAvailable;
  List<String> colorAvailable;
  int quantityRemaining;
  String shortDescription;

  //Constructor
  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.picturePath,
    required this.colorAvailable,
    required this.storageAvailable,
    required this.quantityRemaining,
    required this.shortDescription,
    this.oldPrice
  });
}
