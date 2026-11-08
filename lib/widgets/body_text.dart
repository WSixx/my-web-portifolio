import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 720),
      builder: () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.redAccent, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'ESTE PORTFÓLIO ENCONTRA-SE DESATIVADO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.ssp,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Text(
                  'Hi, i am Lucas Gonçalves!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'stjedise',
                    fontSize: 15.ssp,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Text(
                  'About Me:',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'stjedise',
                    fontSize: 13.ssp,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 0.6,
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Hello, I am passionate about technology, currently studying the 5th semester of Computer Science, I am looking for an opportunity. '
                          'I like to learn and I am fascinated by new technologies, programming for me has become a hobby that I love to spend time.'
                          ' I like to read and watch a wide variety of films.',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white, fontSize: 12.ssp),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Some of my Projects:',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'stjedise',
                fontSize: 13.ssp,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
