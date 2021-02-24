import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portifolio/change_widget.dart';
import 'package:my_portifolio/widgets/shake.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftMenu extends StatefulWidget {
  final ChangeWidget cartModel;

  const LeftMenu({Key key, this.cartModel}) : super(key: key);
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Container(
        width: 300,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      padding: const EdgeInsets.all(20),
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://avatars.githubusercontent.com/u/54176892?s=460&u=4b0b4625a64dec5178064bb8ce62f95ea89d664e&v=4',
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
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin),
                      color: Colors.blue[800],
                      onPressed: () async {
                        await launch(
                            'https://www.linkedin.com/in/lucassgon%C3%A7alves/');
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github),
                      color: Colors.white,
                      onPressed: () async {
                        await launch('https://github.com/WSixx');
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      tooltip: 'Curriculo',
                      icon: const Icon(FontAwesomeIcons.solidFileWord),
                      color: Colors.white,
                      onPressed: () async {
                        await launch(
                            'https://drive.google.com/file/d/1dO_AGGrYSwyF2Uf2EBRyqt5dyGsb72Pq/view');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}