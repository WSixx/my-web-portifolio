import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portifolio/widgets/small_screen_projects_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallScreenHome extends StatefulWidget {
  @override
  _SmallScreenHomeState createState() => _SmallScreenHomeState();
}

class _SmallScreenHomeState extends State<SmallScreenHome> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Lucas Gonçalves Portifolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.network(
                  'https://avatars.githubusercontent.com/u/54176892?s=460&u=4b0b4625a64dec5178064bb8ce62f95ea89d664e&v=4',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Lucas Silva Goncalves',
                textScaleFactor: 3,
                style: TextStyle(
                  fontFamily: 'stjedise',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.redAccent, width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'ESTE PORTFÓLIO ENCONTRA-SE DESATIVADO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Hello, I am passionate about technology, currently studying the 5th semester of Computer Science, I am looking for an opportunity. '
                          'I like to learn and I am fascinated by new technologies, programming for me has become a hobby that I love to spend time.'
                          ' I like to read and watch a wide variety of films.',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      await launch(
                          'https://www.linkedin.com/in/lucasgo/');
                    },
                    child: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blue[800],
                      size: MediaQuery.of(context).size.aspectRatio * 80,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () async {
                      await launch('https://github.com/WSixx');
                    },
                    child: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.aspectRatio * 80,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 912,
              child: Column(
                children: [
                  SmallScreenProjectsWidget(
                    imageAsset: 'assets/images/meals/doublePrint.png',
                    prjTitle: 'Meals APP',
                    prjDescription:
                        'App developed in Flutter for navigation studies between multiple screens',
                    prjgitLink: 'https://github.com/WSixx/Meals-App',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SmallScreenProjectsWidget(
                    imageAsset: 'assets/images/conews/doublePrint2.png',
                    prjTitle: 'Covid News',
                    prjDescription:
                        'You can see the data on COVID-19 updated daily. Data on recovered, infected and deaths. Data from more than 180 countries updated daily',
                    prjgitLink: 'https://github.com/WSixx/conews_flutter',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SmallScreenProjectsWidget(
                    imageAsset: 'assets/images/despesas/doublePrint3.png',
                    prjTitle: 'Despesas Pessoais',
                    prjDescription:
                        'APP developed in Flutter, Personal Expenses for Studies',
                    prjgitLink: 'https://github.com/WSixx/Despesas-Pessoais',
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
