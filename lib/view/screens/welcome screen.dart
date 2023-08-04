
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_btn.dart';
import '../../constant/colors.dart';
import '../auth/login.dart';
import '../auth/signup.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late double lat, long;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset("assets/images/logooo.png"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'دليفراوي',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.titleColor,
                            fontSize: 25,
                            fontFamily: 'ca1',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        ' أهلا بكم بتطبيقكم دليفراوي لتوصيل طلباتكم',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'ca1',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      CustomBtn(
                        onTapBtn: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                        },
                        btnText: "تسجيل دخول",),
                      SizedBox(height: 20,),
                      CustomBtn(
                        onTapBtn: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                        },
                        btnText: "تسجيل مشترك جديد",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
