import 'dart:collection';
import 'package:deliverawy/components/custom_btn.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../constant/colors.dart';
import '../../service/links.dart';
import '../auth/signup.dart';
import 'addNewStore/addStore.dart';

class myLocation extends StatefulWidget {
   myLocation({
     required this.oner ,
     required this.email ,
     required this.password,
     required this.phone,
     required this.area ,
     required this.Shop_name}) ;
      String oner;
      String email;
      String password;
      String phone;
      String area;
      String Shop_name;



  @override
  State<myLocation> createState() => _myLocationState();
}

class _myLocationState extends State<myLocation> {

  var myMarkers = HashSet<Marker>();
  late double lat, long;


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_rounded,
                      color: Colors.white,
                    ),
                Text(
                  'حدد موقعك',
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
          body: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                child: GoogleMap(
                  onTap: (location) async {
                    String _host = 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA';
                    final url = '$_host?key=AIzaSyASaAohO9QuSaGb_oIg7h5i4d7q3sVK78o=${location.latitude},${location.longitude}';
                    var response = await http.get(Uri.parse(url));
                    if (response.statusCode == 200) {
                      print(response.body);
                    } else
                      return null;
                    print(location);
                    setState(() {
                      myMarkers.add(Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(location.latitude, location.longitude),
                        infoWindow: InfoWindow(
                          title: 'موقعي',
                          snippet: 'اخبرنا المزيد',
                          onTap: () {},
                        ),
                      ));

                    });
                    lat = location.latitude;
                    long= location.longitude;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(30.011912109198054, 31.20804801660021),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {},
                  onCameraMove: (camera) async {
                    print(camera.target.latitude);
                    print(camera.target.longitude);
                  },
                  markers: myMarkers,
                ),
              ),
              CustomBtn(onTapBtn: () async {

              dynamic response = await http.post(Uri.parse(
                  "$linkServerName/auth/signup.php =? oner = ${'oner'} & email = ${'email'}& password =${'password'} & phone =${'phone'} & shop_name = ${'shop_name'} & area =${'area'} & lat = ${lat} & long = ${long}"));
              print(response.statusCode);
              if (response.statusCode == 200) {
                String result = response.body;
                print(result);
                if (result == "Success")
                {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPanal()));

                } else {
                  MotionToast.error(
                      title:  Text("Error"),
                      description:  Text("Something is Wrong!!")
                  ).show(context);

                }
              } else {
                MotionToast.error(
                    title:  Text("Error"),
                    description:  Text("Something is Wrong!!")
                ).show(context);

              }




              }, btnText: 'تأكيد')

            ],
          ),
        ));
  }
}