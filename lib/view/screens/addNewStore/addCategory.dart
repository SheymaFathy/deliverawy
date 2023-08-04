import 'package:deliverawy/components/custom_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constant/colors.dart';class addCategory extends StatefulWidget {
  const addCategory({Key? key}) : super(key: key);

  @override
  State<addCategory> createState() => _addCategoryState();
}

TextEditingController addCat1 = new TextEditingController();
late String img;
class _addCategoryState extends State<addCategory> {
  XFile? image;

  ImagePicker picker = ImagePicker();

  uploadImg() async {
    image = await picker.pickImage(source: ImageSource.gallery);
  }

  uploadCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    img = (image!.path);
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("إضافة تصنيف", style: TextStyle(fontFamily: 'ca1')),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      controller: addCat1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text('إسم التصنيف',
                            style: TextStyle(fontFamily: 'ca1')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
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
                                        fontSize: 15.0, fontFamily: 'ca1'),
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
                                        fontSize: 15.0, fontFamily: 'ca1'),
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
                  CustomBtn(onTapBtn: (){}, btnText: "تأكيد")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
