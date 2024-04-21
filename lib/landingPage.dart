import 'package:flutter/material.dart';
import 'package:motolert/itemCapture.dart';
import 'package:motolert/map.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
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
                                child: const Text(
                                  "Ryan James",
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
                                                  child: Switch(
                                                    value: isSwitched1,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isSwitched1 = value;
                                                      });
                                                    },
                                                    
                                                    activeColor:  Colors.purple,
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
                                                  child: Switch(
                                                    value: isSwitched2,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isSwitched2 = value;
                                                      });
                                                    },
                                                    
                                                    activeColor: Colors.purple,
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
                            child: const ItemCapture(),
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
      ),
    );
  }
}
