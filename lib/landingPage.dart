import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motolert/itemCapture.dart';
import 'package:motolert/map.dart';
import 'package:http/http.dart' as http;
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  String deviceName = '';
  dynamic imgs = [];
  final route = 'http://motolert.c1.is/db.php';

  @override
  void initState() {
    super.initState();
    getDevice('1');
    getImgs('1');
  }

  Future<dynamic> setStatus(String query) async {
    try {
      final response = await http.get(Uri.parse(Uri.encodeFull(route+query)), headers: {
            "Content-Type": "application/json"
          },);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
       throw Exception("error updating status");
    }
  }

  Future<dynamic> getDevice(String deviceId) async {
    try {
      final response = await http.get(Uri.parse(Uri.encodeFull(route+'?action=getDevice&did='+deviceId)), headers: {
            "Content-Type": "application/json"
          },);
      final data = jsonDecode(response.body);
      print(data['device']['iEngine']);
      print(data['device']['iParking']);
      
      setState((){
        isSwitched1 = (data['device']['iEngine'] == 1)?true:false;
        isSwitched2 = (data['device']['iParking'] == 1)?true:false;
        deviceName = data['device']['sDeviceName'];
      });
      return data;
    } catch (e) {
       throw Exception("error updating status");
    }
  }

  Future<dynamic> getImgs(String deviceId) async {
    try {
      final response = await http.get(Uri.parse(Uri.encodeFull(route+'?action=imgs&did='+deviceId)), headers: {
            "Content-Type": "application/json"
          },);
      final data = jsonDecode(response.body);
      setState((){
        imgs = data;
      });
      return data;
    } catch (e) {
       throw Exception("error updating status");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3, // Set flex factor to 3 for 30% height
                  child: Card(
                    elevation: 3,
                    color: Colors.purple,
                    shadowColor: Colors.black,
                    margin: const EdgeInsets.only(
                        top: 15, left: 15, right: 15), // Remove any default margins
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
          
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2, // Set flex factor to 2 for 2 rows
                          child: Container(
                            // Example color for the first section
                            height: double
                                .infinity, // Ensure the Container expands vertically
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 12),
                                    color: Colors.transparent,
                                    height: double.infinity,
                                    child: Text(
                                      deviceName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ), // Ensure the Container expands vertically
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 12),
                                    color: Colors.transparent,
                                    height: double.infinity,
                                    child: const Icon(
                                      Icons.account_circle_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          // Set flex factor to 5 for 85% width
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
          
                            // Example color for the second section
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            padding:
                                                EdgeInsets.only(left: 20, top: 10),
                                            child: RichText(
                                              text: const TextSpan(
                                                text: 'Total\n',
                                                style: TextStyle(
                                                  color: Color(0xFF424242),
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'Image Captured',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.normal,
                                                      textBaseline: TextBaseline
                                                          .alphabetic, // Align the subtext with the alphabetic baseline
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Container(
                                        
                                          // color: Colors.blue,
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.only(right: 20,top:10),
                                          child: const Text(
                                            "12",
                                            style: TextStyle(
                                              color: Color(0xFF424242),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  // color: Colors.red,
                                                  alignment: Alignment.bottomLeft,
                                                  
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.motorcycle_sharp,size: 30,color: Color(0xFF424242),),
                                                      const Text(
                                                        "  Park Mode",
                                                        style: TextStyle(
                                                            color: Color(0xFF424242),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  //  color: Colors.blue,
                                                  alignment: Alignment.topLeft,
                                                  
                                                  child: Row(
                                                    children: [
                                                    Icon(Icons.security_sharp,size: 28,color: Color(0xFF424242),),
                                                  Text(
                                                    "  Engine Lock",
                                                    style: TextStyle(
                                                        color: Color(0xFF424242),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                    ],
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.blue,
                                          padding: EdgeInsets.only(right: 20,top: 10,bottom: 10),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.bottomRight,
          
                                                  // color: Colors.blue,
                                                  child: SizedBox(
                                                    width: 55,
                                                    height: 40,
                                                    child: FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: FutureBuilder<dynamic>(
                                                        future: setStatus('?action=setParking&status='+(isSwitched1?'1':'0')+'&did=1'),
                                                        builder: (context, snapshot) {
                                                          return Switch(
                                                            value: isSwitched1,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                isSwitched1 = value;
                                                              });
                                                            },
                                                            
                                                            activeColor:  Colors.purple,
                                                          );
                                                        }
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  // color: Colors.blue,
                                                  child: SizedBox(
                                                    width: 55,
                                                    height: 40,
                                                    child: FittedBox(
                                                      fit: BoxFit.fill,
                                                      child: FutureBuilder<dynamic>(
                                                        future: setStatus('?action=setEngine&status='+(isSwitched2?'1':'0')+'&did=1'),
                                                        builder: (context, snapshot) {
                                                          return Switch(
                                                            value: isSwitched2,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                isSwitched2 = value;
                                                              });
                                                            },
                                                            
                                                            activeColor: Colors.purple,
                                                          );
                                                        }
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                DefaultTabController(
                  length: 2, // Number of tabs
                  child: Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: Colors.purple,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.purple,
                          automaticIndicatorColorAdjustment: true,
                          tabs: [
                            Tab(text: 'Gallery'), // First tab with label 'Tab 1'
                            Tab(text: 'Location'), // Second tab with label 'Tab 2'
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                child: ItemCapture(imgs: imgs),
                              ),
                              Container(
                                
                                padding: EdgeInsets.all(15),
                                child: const Map(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}
