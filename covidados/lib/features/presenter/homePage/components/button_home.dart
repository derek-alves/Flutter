import 'package:covidados/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonHome extends StatelessWidget {
  final int color;
  final String image;
  final String title;
  final String route;
  ButtonHome({
    required this.color,
    required this.image,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.18,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(this.color),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () => Get.toNamed("/home" + route),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width * 0.08,
                backgroundColor: Color(0xffF8F8F8),
                child: AspectRatio(
                  aspectRatio: 0.6,
                  child: Image.asset(
                    this.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              FittedBox(
                child: Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
// GestureDetector(
//         onTap: () {
//           print("foi");
//         },
//         child: Container(
//           color: Color(this.color),
//           width: 150,
//           height: 90,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CircleAvatar(
//                 maxRadius: constraints.maxWidth * 0.9,
//                 backgroundColor: Color(0xffF8F8F8),
//                 child: Image.asset(
//                   this.image,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(
//                 height: 2,
//               ),
//               Text(
//                 this.title,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       );
