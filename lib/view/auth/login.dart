import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deliverawy/constant/colors.dart';
import 'package:deliverawy/view/auth/signup.dart';
import 'package:deliverawy/view/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_textfeild1.dart';


class LogIn extends StatefulWidget {


  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;
  late double lat, long;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: AppColors.primaryBgColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  AppColors.secondaryColor
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
                            .height * 0.05,
                        left: MediaQuery
                            .of(context)
                            .size
                            .width * 0.07,
                        right: MediaQuery
                            .of(context)
                            .size
                            .width * 0.1),
                    child: Image.asset(
                      'assets/images/logooo.png',
                      width: 300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.30),
                    child: Container(
                      height: double.infinity,
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Center(
                            child: Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 37,
                                  fontFamily: "ca1"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "مرحبًا بعودتك يرجى تسجيل الدخول الآن",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.47),
                                  fontSize: 13,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
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
                                    .width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email),
                                null,
                                false,
                                emailController,
                                    (value) {}
                            ),
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
                                    (value) {}

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
                                    .width * 0.07),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'نسيت كلمة المرور ؟',
                                      style: TextStyle(
                                        fontFamily: 'ca1',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ],
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
                                  .width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                if (formKey.currentState!.validate()) {
                                  login("${emailController.text}","${passwordController.text}");
                                }
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
                                  .width * 0.07,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ليس لديك حساب ؟',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ca2',
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupPage(

                                                )));
                                  },
                                  child: const Text('سجل الآن',
                                      style: TextStyle(
                                          fontSize: 15,
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
  void login(String email,String password) async {
    Uri url = Uri.parse('http://192.168.252.95/deliverawy/auth/login.php?email=${email}&password=${password}');
    var response = await http.get(url);
    // Send the POST request

    // Process the response
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if(jsonResponse["status"]=="success"){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', jsonResponse["id"]);
        prefs.setString('oner', jsonResponse["oner"]);
        prefs.setString('email', jsonResponse["email"]);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const products()));
      }else if(jsonResponse["status"]=="failed"){

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${jsonResponse["message"]}"),
              actions: [
                TextButton(
                  child: Text('حاول مره اخرى'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );


      }

    } else {
      print('POST request failed! Status code: ${response.statusCode}');
    }
  }

}
