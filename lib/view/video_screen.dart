import 'package:flutter/material.dart';

import '../size_config.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? width = SizeConfig.screenWidth;
    double? height = SizeConfig.screenHeight;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width! * 0.02, vertical: height! * 0.02),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width! > 580 ? 3 : 2,
                childAspectRatio: 4/3,
                crossAxisSpacing: width! * 0.05,
                mainAxisSpacing: height! * 0.1
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/${index+1}.jpg', fit: BoxFit.fill,)),
              );
            },),
      ),
    );
  }
}
