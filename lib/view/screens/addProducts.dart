import 'dart:io';
import 'package:deliverawy/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/custom_textfeild1.dart';
import '../../models/category_model.dart';
import 'addNewStore/addStore.dart';
import 'nb.dart';

class addProducts extends StatefulWidget {

  @override
  State<addProducts> createState() => _addProductsState();
}

class _addProductsState extends State<addProducts> {
  TextEditingController proName = new TextEditingController();
  TextEditingController proPrice = new TextEditingController();
  TextEditingController proWeight = new TextEditingController();
  TextEditingController proCount = new TextEditingController();

  XFile? image;
  late XFile _image;
  ImagePicker picker = ImagePicker();

  uploadImg() async {
    image = await picker.pickImage(source: ImageSource.gallery);
  }

  uploadCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    img = (_image.path);
  }

  late String img;
  late final listOfCategory = <CategoryModel>[];

  String? key;
  bool? choose = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("إضافة منتج", style: TextStyle(fontFamily: 'ca1'),

          ),
          centerTitle: true,
          actions: [IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBarApp()));
          }, icon: Icon(Icons.arrow_forward_ios))],
        ),
        // drawer: myDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listOfCategory.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButton<CategoryModel>(
                    value: listOfCategory[0],
                    onChanged: (newValue) {
                      print(newValue!.name);
                      key = newValue.key;
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem<CategoryModel>(
                        child: Text(category.name!),
                        value: category,
                      );
                    }).toList(),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  FormFields(
                      "اسم المنتج",
                      Icon(Icons.store),
                      null,
                      false,
                      proName,
                          (value) {

                          }),
                  SizedBox(
                    height: 10,
                  ),
                  FormFields(
                      "العدد ",
                      Icon(Icons.numbers_rounded),
                      null,
                      false,
                      proCount,
                          (value) {

                      }),
                  SizedBox(
                    height: 10,
                  ),
                  FormFields(
                      "السعر ",
                      Icon(Icons.paid_outlined),
                      null,
                      false,
                      proPrice,
                          (value) {

                      }),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'اضف صورة',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ca1',
                        color: AppColors.textColor),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                            onTap: uploadImg,
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.photo_camera_back,
                                    size: 80.0,
                                    color: AppColors.iconColor,
                                  ),
                                  Text(
                                    "الاستوديو",
                                    style: TextStyle(
                                        fontSize: 15.0, fontFamily: 'reg'),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          child: GestureDetector(
                            onTap: uploadCamera,
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.camera_alt,
                                    size: 80.0,
                                    color: AppColors.iconColor,
                                  ),
                                  Text(
                                    "الكاميرا",
                                    style: TextStyle(
                                        fontSize: 15.0, fontFamily: 'reg'),
                                  )
                                ],
                              ),
                            ),
                          )),

                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(17)),
                    child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            'تأكيــــــــــد',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ca1',
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () async {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPanal()));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
