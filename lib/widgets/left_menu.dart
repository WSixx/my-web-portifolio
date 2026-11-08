import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portifolio/utils/change_widget.dart';
import 'package:my_portifolio/widgets/shake.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftMenu extends StatefulWidget {
  final ChangeWidget aboutOrHome;

  const LeftMenu({Key key, this.aboutOrHome}) : super(key: key);
  @override
  _LeftMenuState createState() => _LeftMenuState();
}

class _LeftMenuState extends State<LeftMenu> {
  bool _enabled = false;
  bool page = false;
  void startTimer() {
    Future<void>.delayed(const Duration(seconds: 2), () {
      setState(() {
        _enabled = !_enabled;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var updateWidget = Provider.of<ChangeWidget>(context);
    return ScreenUtilInit(
      designSize: Size(480, 720),
      allowFontScaling: true,
      builder: () => Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShakeAnimatedWidget(
              enabled: _enabled,
              duration: const Duration(milliseconds: 1500),
              shakeAngle: Rotation.deg(z: 50),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _enabled = !_enabled;
                    startTimer();
                    //playAudio();
                  });
                },
                child: Container(
                  //width: 100.w,
                  //height: 100.h,
                  padding: const EdgeInsets.all(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200.0),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/54176892?s=460&u=4b0b4625a64dec5178064bb8ce62f95ea89d664e&v=4',
                      //width: 200.w,
                      //height: 200.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShakeWidget(
              duration: const Duration(seconds: 2),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    updateWidget.add();
                  });
                },
                child: Text(
                  updateWidget.page ? 'HOME' : 'About',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 30),
                  //textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 1.sw,
              //height: constraints.maxHeight * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () async {
                        await launch(
                            'https://www.linkedin.com/in/lucasgo/');
                      },
                      child: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue[800],
                        size: MediaQuery.of(context).size.aspectRatio * 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () async {
                        await launch('https://github.com/WSixx');
                      },
                      child: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.aspectRatio * 20,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
