import 'dart:collection';
import 'package:deliverawy/view/auth/signup.dart';
import 'package:http/http.dart' as http;
import 'package:deliverawy/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class myLocation extends StatefulWidget {
  const myLocation({Key? key}) : super(key: key);

  @override
  State<myLocation> createState() => _myLocationState();
}

class _myLocationState extends State<myLocation> {

  var myMarkers = HashSet<Marker>();
  late double lat, lan;


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Google Map')),
                ],
              )
            ],
            elevation: 0,
            backgroundColor: AppColors.primaryBgColor,
          ),
          body: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                child: GoogleMap(
                  onTap: (location) async {
                    String _host = 'https://maps.google.com/maps/api/geocode/json';
                    final url =
                        '$_host?key=AIzaSyASaAohO9QuSaGb_oIg7h5i4d7q3sVK78o=${location.latitude},${location.longitude}';
                    var response = await http.get(Uri.parse(url));
                    if (response.statusCode == 200) {
                      print(response.body);
                    } else
                      return null;
                    print(location);
                    setState(() {
                      myMarkers.add(Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(location.latitude, location.longitude),
                        infoWindow: InfoWindow(
                          title: 'موقعي',
                          snippet: 'اخبرنا المزيد',
                          onTap: () {},
                        ),
                      ));

                    });
                    lat = location.latitude;
                    lan= location.longitude;
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
              MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text('تأكيــــــــــد',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'reg',
                        color: AppColors.primaryColor
                    ),),
                  ),
                  onPressed: ()async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupPage(lan: lan, lat: lat, )));

                  }),
            ],
          ),
        ));
  }
}