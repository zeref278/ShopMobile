import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/order.dart';

import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/users_provider.dart';
import 'package:project/ui/widget_customization/button_customization/custom_button.dart';
import 'package:project/ui/widget_customization/card_customization/order_detail_item.dart';
import 'package:project/ui/widget_customization/text_field_customization/text_field_customization.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../widget_customization/divider_customization/text_divider.dart';


// This is screen handle what occur when you click BUY NOW in PRODUCT DETAIL screen

class CheckoutOneItemScreen extends StatefulWidget {
  final CartItemModel itemModel;

  CheckoutOneItemScreen({required this.itemModel});

  @override
  State<CheckoutOneItemScreen> createState() => _CheckoutOneItemScreenState();
}

class _CheckoutOneItemScreenState extends State<CheckoutOneItemScreen> {

  //------Create random id
  Random random = new Random();
  int randomNumber = 0;

  //------COD or Credit Card
  bool isCod = true;

  //------Like name
  late var controllerAddress;

  @override
  void initState() {
    randomNumber = random.nextInt(10000);
    controllerAddress = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: defaultPrimaryColor,
        title: Text('Checkout'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              TextDivider(
                child: Text(
                  'Information Delivery',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(height: 5,),
              Consumer<UserProvider>(
                builder: (context, userData, _) {
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10, bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Name: ', style: TextStyle(fontSize: 16)),
                              Text(
                                '${userData.user.userName}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Phone: ', style: TextStyle(fontSize: 16)),
                              Text(
                                '${userData.user.phoneNumber}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          TextFieldCustomization(
                            controller: controllerAddress,
                            isEdit: true,
                            icon: Icon(CupertinoIcons.placemark),
                            label: 'Address',
                            hintText: userData.user.address ?? 'No information yet',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 10,),
              TextDivider(
                child: Text(
                  'Products',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(height: 5,),

              //------View product
              OrderDetailItem(itemModel: widget.itemModel),

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Price: ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    '${formatter.format(widget.itemModel.getCartItemPrice())} VNĐ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  )
                ],
              ),
              SizedBox(height: 10,),
              TextDivider(
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(height: 5,),

              //------Button switch COD - Credit Card
              ButtonCustomization(
                textColor: !isCod ? Colors.white : Colors.black,
                iconData: CupertinoIcons.creditcard,
                color: !isCod ? Colors.green : Colors.white,
                text: 'Credit Card',
                onPressed: () {
                  setState(() {
                    isCod = false;
                  });
                },
                tailIcon: !isCod
                    ? Icon(CupertinoIcons.checkmark_alt, color: Colors.white)
                    : Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.black,
                      ),
              ),
              SizedBox(
                height: 10,
              ),

              //------Button switch COD - Credit Card
              ButtonCustomization(
                textColor: isCod ? Colors.white : Colors.black,
                iconData: CupertinoIcons.paperplane,
                color: isCod ? Colors.green : Colors.white,
                text: 'COD',
                onPressed: () {
                  setState(() {
                    isCod = true;
                  });
                },
                tailIcon: isCod
                    ? Icon(CupertinoIcons.checkmark_alt, color: Colors.white)
                    : Icon(
                        CupertinoIcons.chevron_right,
                        color: Colors.black,
                      ),
              ),

              SizedBox(height: 10,),
              TextDivider(
                child: Text(
                  'Confirm',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red,
                    elevation: 10,
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Consumer<OrderProvider>(builder: (context, orderData, _) {
                    return MaterialButton(

                      //------When you pressed ORDER, provider add new order in ORDER PROVIDER
                      //and clear CART ITEM

                      onPressed: () {
                        orderData.addOrder(Order(
                            status: 1,
                            timeOrder: DateFormat('dd/MM/yyyy kk:mm:ss').format(DateTime.now()),
                            paymentMethod: isCod ? 'COD' : 'Credit Card',
                            listItem: [widget.itemModel],
                            totalPrice: widget.itemModel.getCartItemPrice(),
                            id: 'order' + '$randomNumber'));

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Notification",
                                  style: TextStyle(fontSize: 18),
                                ),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.sun_min,
                                      size: 30,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Order successful !",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              );
                            });
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'ORDER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
