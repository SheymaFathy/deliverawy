
import 'package:deliverawy/view/auth/signup.dart';
import 'package:flutter/material.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_textfeild1.dart';
import '../../constant/colors.dart';
import '../screens/nb.dart';
import '../screens/home.dart';

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
  //
  // myFunc myfun = myFunc();
  //
  // login()async{
  //   var response = await myfun.postRequest(linklogin,
  //       {
  //         "email": emailController.text,
  //         "password": passwordController.text,
  //       });
  //   if (response["status"]=="success"){
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  //   }else{
  //     AwesomeDialog(
  //       context: context,
  //       title: "تنبيه",
  //       body: Text("الببريد الأليكتروني او كلمة المرور خطأ أو الحساب غير مسجل لدينا!")
  //     );
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: AppColors.primaryBgColor,
        body: Container(
          decoration: BoxDecoration(
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
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
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
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.titleColor,
                              fontSize: 30,
                              fontFamily: 'ca1',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Text(
                          "مرحبًا بعودتك يرجى تسجيل الدخول الآن ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 19,
                              fontFamily: "ca1",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.07,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
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
                            top: MediaQuery.of(context).size.width * 0.07,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
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
                                .width * 0.05,
                            right:
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {

                                },
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
                            top: MediaQuery
                                .of(context)
                                .size
                                .width * 0.03,
                            left: MediaQuery
                                .of(context)
                                .size
                                .width * 0.05,
                            right:
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.05),
                        child: CustomBtn(
                          onTapBtn: () async {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationBarApp()));
                              // String x = emailController.text;
                              // String y = passwordController.text;
                              //
                              // dynamic response = await http.get(Uri.parse(
                              //     "http://192.168.252.95/deliverawy/auth/login.php?email=${y}&password=${x}"));
                              // print(response.statusCode);
                              // if (response.statusCode == 200) {
                              //   String result = response.body;
                              //   print(result);
                              //   if (result == "Success")
                              //   {
                              //
                              //
                              //   } else {
                              //     MotionToast.error(
                              //         title:  Text("Error"),
                              //         description:  Text("Something is Wrong!!")
                              //     ).show(context);
                              //
                              //   }
                              // } else {
                              //   MotionToast.error(
                              //       title:  Text("Error"),
                              //       description:  Text("Something is Wrong!!")
                              //   ).show(context);
                              //
                              // }
                            }
                          },
                          btnText: 'تأكيد',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                          right: MediaQuery.of(context).size.width * 0.07,
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
                                        builder: (context) => SignupPage()));
                              },
                              child: const Text('سجل الآن',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ca2',
                                      color: AppColors.titleColor)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
