import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InformationModal extends StatefulWidget {
  InformationModal({super.key, required this.fName});
  final String fName;
  @override
  State<InformationModal> createState() => _InformationModalState();
}

class _InformationModalState extends State<InformationModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
          alignment: Alignment.center,
          child: Image.network(
            widget.fName,
            height: 300, // Set the height of the image
            width: 200, // Set the width of the image
            fit: BoxFit.cover,
          )),
      content: const Column(
        mainAxisSize: MainAxisSize.min, // Ensure minimal height for the content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Longitude: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('69°',),
            ],
          ),
          SizedBox(height: 5), // Add space between rows
          Row(
            children: [
              Text(
                'Latidute: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('109°'),
            ],
          ),
          SizedBox(height: 5), // Add space between rows
          Row(
            children: [
              Text(
                'Date: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('04/21/2021'),
            ],
          ),
          SizedBox(height: 5), // Add space between rows
          Row(
            children: [
              Text(
                'Time: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('2:00pm'),
            ],
          ),
        ],
      ),
      
    );
  }
}
