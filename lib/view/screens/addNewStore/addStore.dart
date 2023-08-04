import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import 'addCategory.dart';


class AdminPanal extends StatefulWidget {
  @override
  _AdminPanalState createState() => _AdminPanalState();
}

class _AdminPanalState extends State<AdminPanal> {

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("لوحة التحكم", style: TextStyle(fontFamily: 'ca1')),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      // drawer: myDrawer(),//myDrawer
      body:ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child:
            Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addCategory()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.category,
                                size: 80.0,
                                color: AppColors.primaryColor,
                              ),
                              Text(
                                "إضافة تصنيف",
                                style: TextStyle(fontSize: 15.0,fontFamily: 'ca1'),
                              )
                            ],
                          ),
                        ))),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AddResturant()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 80.0,
                              color: AppColors.iconColor,
                            ),
                            Text(
                              "إضافة مطعم",
                              style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),),
          Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AddMeal()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.no_meals,
                            size: 80.0,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            "إضافة وجبة",
                            style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AddDrink(),));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.local_drink,
                            size: 80.0,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            "المشروبات",
                            style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AddFastFood()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.fastfood,
                            size: 80.0,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            "وجبات سريعة",
                            style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.local_offer,
                            size: 80.0,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            "عروض",
                            style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Delivery()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.menu,
                            size: 80.0,
                            color: AppColors.iconColor,
                          ),
                          Text(
                            "الطلبات",
                            style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.message,
                          size: 80.0,
                          color: AppColors.iconColor,
                        ),
                        Text(
                          "الرسائل",
                          style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                        )
                      ],
                    ),
                  )),
            ],
          ),


        ],
      ),
    ),
    );
  }
}