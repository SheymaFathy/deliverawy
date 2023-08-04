
import 'package:deliverawy/view/screens/home.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

import 'addNewStore/addStore.dart';
import 'addProducts.dart';
import 'location.dart';
import 'mycart.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:  Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[

          NavigationDestination(
            selectedIcon: Icon(Icons.home,color:AppColors.btnText,),
            icon: Icon(Icons.home,color: AppColors.iconColor,),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart,color: AppColors.btnText,),
            icon: Icon(Icons.shopping_cart,color: AppColors.iconColor,),
            label: 'سلتي',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add,color: AppColors.btnText,),
            icon: Icon(Icons.add,color: AppColors.iconColor,),
            label: 'اضافة منتجات',
          ),

        ],
      ),


      body: <Widget>[
        HomePage(),
        MyCart(),
        addProducts(),

      ][currentPageIndex],
    )
    );
  }
}
