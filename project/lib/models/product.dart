class Product {
  //Attribute
  String name;
  String category;
  int price;
  String picturePath;
  int? oldPrice;
  List<String> storageAvailable;

  // To create dynamic price from options
  var bonusMap;

  List<String> colorAvailable;
  int quantityRemaining;
  String shortDescription;

  int calcPrice(String newStorage, String newColor){
    return price + int.parse(bonusMap[newStorage]) + int.parse(bonusMap[newColor]);
  }
  int calcOldPrice(String newStorage, String newColor){
    return oldPrice! + int.parse(bonusMap[newStorage]) + int.parse(bonusMap[newColor]);
  }



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
    required this.bonusMap,
    this.oldPrice
  });


}
