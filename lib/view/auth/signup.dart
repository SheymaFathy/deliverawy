import 'dart:convert';
import 'dart:core';
import 'package:deliverawy/constant/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_textfeild1.dart';
import '../../service/functions.dart';
import '../../service/links.dart';
import '../screens/location.dart';
import '../screens/products.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {late double lat, long;
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  myFunc myfun = myFunc();
  var onerController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var shopController = TextEditingController();
  var areaController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white12,
                ]),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05),
                    child: Container(
                      height: double.infinity,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              "تسجيل مشترك جديد",
                              style: TextStyle(
                                  color: AppColors.titleColor,
                                  fontSize: 20,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text(
                              "مرحبًا بك يرجى تسجيل بياناتك الآن",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.47),
                                  fontSize: 13,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => myLocation()));
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.only(right: 15.0),
                          //     padding: EdgeInsets.all(10.0),
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(15.0)),
                          //     child: Row(
                          //       children: <Widget>[
                          //         Icon(
                          //           Icons.location_on_outlined,
                          //           size: 30.0,
                          //           color: AppColors.iconColor,
                          //         ),
                          //         Text(
                          //           "اخترالموقع",
                          //           style: TextStyle(
                          //               fontSize: 15.0, fontFamily: 'ca1'),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields("الاسم", Icon(Icons.person), null,
                                false, onerController, (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email),
                                null,
                                false,
                                emailController,
                                    (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields(
                                "كلمة المرور",
                                Icon(Icons.lock),
                                IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Issecure = !Issecure;
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                Issecure,
                                passwordController,
                                    (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields(
                                "رقم الهاتف المحمول",
                                Icon(Icons.phone),
                                null,
                                false,
                                phoneController,
                                    (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields("اسم المتجر", Icon(Icons.home),
                                null, false, shopController, (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.03,
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.07),
                            child: FormFields("العنوان", Icon(Icons.home), null,
                                false, areaController, (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.07,
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.07,
                              right: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () async {
                               await signUp();
                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.07,
                              right: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.09,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  ' لديك حساب بالفعل ؟',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'ca2',
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogIn()));
                                  },
                                  child: const Text('سجل دخول الآن',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'ca2',
                                          color: Colors.black)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    var response = await myfun.postRequest(linkSignUp, {
      "oner": onerController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phone": phoneController.text,
      "shop_name": shopController.text,
      "area": areaController.text,
    });
    if (response["status"] == "sccess") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('oner', onerController.text);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
        prefs.setString('shop_name', shopController.text);
        prefs.setString('area', areaController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myLocation()));
      } else {
        print("Sign Up feild");
      }
    }
  }



