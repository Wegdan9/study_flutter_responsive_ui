import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:study_flutter_responsive_ui/size_config.dart';
import 'package:study_flutter_responsive_ui/view/video_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? width = SizeConfig.screenWidth;
    double? height = SizeConfig.screenHeight;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
        children: [
          ///clipping the top
          ClipPath(
            child: Container(
              color: Colors.amber,
              width: width,
              height: height! * 0.2,
            ),
            clipper: WaveClipperOne(),
          ),
          ClipPath(
            child: Container(
              color: Colors.amber[600],
              width: width,
              height: height! * 0.15,
            ),
            clipper: WaveClipperTwo(),
          ),
          /// clipping the bottom
          Positioned(
            bottom: 0,
            left: 0,
              child: ClipPath(
                child: Container(
                  color: Colors.amber,
                  width: width,
                  height: height! * 0.2,
                ),
                clipper: WaveClipperOne(reverse: true),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: ClipPath(
                child: Container(
                  color: Colors.amber[600],
                  width: width,
                  height: height! * 0.15,
                ),
                clipper: WaveClipperTwo(reverse: true),
              )),

          width! < 580 ?
              /// for mobile devices
              Container(
               width: width,
                height: height,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: height! * 0.1),
                        height: height! * 0.3,
                        child: Image.asset('assets/images/web.png', fit: BoxFit.contain)
                    ),
                    SizedBox(height: height! * 0.02,),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: width! *0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flutter Courses", style: TextStyle(fontSize: kIsWeb ? 64 : 36, fontWeight: FontWeight.bold, color: Colors.amber[300]),),
                              SizedBox(height: height! * 0.02,),
                              Text('Flutter makes it easy for everyone to dessiminate knowledge, and make difficult problems easy to solve.',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1, color: Colors.grey[600]),),
                              SizedBox(height: height! * 0.04,),
                              OutlinedButton.icon(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(),));
                                  },
                                  icon: Icon(Icons.video_library, color: Colors.white,),
                                  label: Text('See Videos',style:TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))

                                  ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
            /// for web
              :Container(
                  height: height,
                  width: width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: width! * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Flutter Courses", style: TextStyle(fontSize: 64 , fontWeight: FontWeight.bold, color: Colors.amber[300]),),
                                      SizedBox(height: height! * 0.02,),
                                      Text('Flutter makes it easy for everyone to dessiminate knowledge, and make difficult problems easy to solve.',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1, color: Colors.grey[600]),),
                                      SizedBox(height: height! * 0.04,),
                                      OutlinedButton.icon(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => VideoScreen(),));
                                        },
                                        icon: Icon(Icons.video_library, color: Colors.white,),
                                        label: Text('See Videos',style:TextStyle(color: Colors.white)),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))

                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                              Expanded(child: Container(child: Image.asset('assets/images/web.png', fit: BoxFit.contain,),))
                          ],
                ),
                      )
              ],
            ),
          ) ,

        ],
        ),
      ),
    );
  }
}
