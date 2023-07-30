import 'package:deliverawy/constant/colors.dart';
import 'package:flutter/material.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_textfeild1.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
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
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: MediaQuery.of(context).size.height * 0.05,
                  //       left: MediaQuery.of(context).size.width * 0.07,
                  //       right: MediaQuery.of(context).size.width * 0.1),
                  //   child: Image.asset(
                  //     'assets/images/logooo.png',
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10),
                    child: Container(
                      height: double.infinity,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              "تسجيل مشترك جديد",
                              style: TextStyle(
                                  color: AppColors.titleColor,
                                  fontSize: 32,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 15,),
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
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields("الاسم", Icon(Icons.person), null,
                                false, nameController,
                                    (value){}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email),
                                null,
                                false,
                                emailController,
                                    (value){}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
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
                                    (value){}),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "العنوان",
                                Icon(Icons.home),
                                null,
                                false,
                                addressController,
                                    (value){}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right: MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "رقم الهاتف المحمول",
                                Icon(Icons.phone),
                                null,
                                false,
                                phoneController,
                                    (value){}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.07,
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {


                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.09,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const  Text(
                                  ' لديك حساب بالفعل ؟',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'ca2',
                                      color:  Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LogIn()));
                                  },
                                  child: const Text('سجل دخول الآن',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'ca2',
                                          color:  Colors.black)),
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
}

