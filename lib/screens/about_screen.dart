import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portifolio/widgets/background_bubble.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 720),
      allowFontScaling: true,
      builder: () => Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.transparent,
          child: BackgroundBubble(
            child: Column(
              children: [
                Text(
                  'Education:',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'stjedise',
                    fontSize: 32.ssp,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Icon(
                        Icons.computer,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.aspectRatio * 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SelectableText(
                        "Bachelor's Degree in Computer Science (2019 - 12/2022) - Unip",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white, fontSize: 26.ssp),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Icon(
                        Icons.computer,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.aspectRatio * 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SelectableText(
                        'Técnico em Informática (2014) - ETEC Aristóteles Ferreira',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white, fontSize: 26.ssp),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Contact:',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'stjedise',
                    fontSize: 32.ssp,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.aspectRatio * 20,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SelectableText(
                            'lucas.2007s@gmail.com',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white, fontSize: 26.ssp),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
