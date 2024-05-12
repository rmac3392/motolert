import 'package:flutter/material.dart';
import 'package:motolert/informationModal.dart';
import 'package:motolert/itemCapture.dart';

class ItemCapture extends StatefulWidget {
  ItemCapture({super.key, required this.imgs});
  final List<dynamic> imgs;

  @override
  State<ItemCapture> createState() => _ItemCaptureState();
}

class _ItemCaptureState extends State<ItemCapture> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.imgs.length,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.indigo[300],
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return InformationModal(fName: "http://motolert.c1.is/uploads/"+widget.imgs[index]['sFilename']);
              },
            );
          },
          child: ListTile(
            textColor: Colors.grey[800],
            title: Text('Captured Image'),
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8.0), // Set the border radius for the image
                border: Border.all(
                  color: Colors.grey, // Set the color of the border
                  width: 1.0, // Set the width of the border
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    7.0), // Set the border radius for the image inside the border
                child: Image.network(
                  "http://motolert.c1.is/uploads/"+widget.imgs[index]['sFilename'],
                  height: 45, // Set the height of the image
                  width: 45, // Set the width of the image
                  fit: BoxFit
                      .cover, // Adjust how the image fits within the specified dimensions
                ),
              ),
            ),
            isThreeLine: false,
            subtitle: Text("04-21-2024"),
            trailing: Text("3:00 pm"),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0.4,
        );
      },
    );
  }
}
