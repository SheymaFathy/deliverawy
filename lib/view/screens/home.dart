
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController srh = TextEditingController();
  final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _keyDrawer,
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              Text(
                'الرئيسية',
                style:
                TextStyle(fontFamily: 'ca1', fontWeight: FontWeight.bold, color: AppColors.btnText),
              )
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: AppColors.iconColor,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextFormField(
                              controller: srh,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white54,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.titleColor,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {

                                    },
                                  ),
                                  label: Text(
                                    'بحث',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                        fontFamily: 'ca1'),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.teal[50],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("cat_image"),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "اسم التصنيف",
                        style: TextStyle(fontFamily: 'ca1', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal[50],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("pro_image"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "اسم المنتج",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'ca1'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الوزن الصافي ",
                      style: TextStyle(color: AppColors.primaryColor, fontFamily: 'ca1'),
                    ),
                    Row(
                      children: [
                        Text(
                          "50 ",
                          style: TextStyle(color: AppColors.primaryColor, fontFamily: 'ca1'),
                        ),
                        Text(
                          "كغم",
                          style: TextStyle(color: AppColors.primaryColor, fontFamily: 'ca1'),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: AppColors.iconColor,))
                      ],
                    ),

                  ],
                ),
              ],
            ),
          ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}

