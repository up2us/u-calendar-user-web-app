import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'U Calendat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: MyHomePage(),
      ),
    );  
  }
}

class MyAppState extends ChangeNotifier {
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var r = constraints.maxWidth/constraints.maxHeight;
          if (r > 4/3) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                ),
                child: AspectRatio(
                  aspectRatio: 16/9,  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 23,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.center,
                                child: DateSection(),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: constraints.maxWidth,
                                  child: imageSection,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 38,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: enTextSection,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: chTextSection,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          else {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                ),
                child: AspectRatio(
                  aspectRatio: 3/4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 18,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 63,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 378,
                              child: DateSection(),
                            ),
                            Expanded(
                              flex: 63,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 672,
                              child: imageSection,
                            ),
                            Expanded(
                              flex: 96,
                              child: enTextSection,
                            ),
                            Expanded(
                              flex: 48,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 96,
                              child: chTextSection,
                            ),
                            Expanded(
                              flex: 96,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                    ],
                  )
                ),
              )
            );
          }
        },
      ),
    );
  }
}

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) { 
    var appState = context.watch<MyAppState>();

    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (contxt, snapshot) {
        return AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: FittedBox(child: Text(DateFormat('MMM').format(DateTime.now()),),),
              ),
              Expanded(
                flex: 10, 
                child: FittedBox(
                  child: Text(
                    DateFormat('dd').format(DateTime.now()),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Text(
                    DateFormat('E').format(DateTime.now()),
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  child: Text(
                    DateFormat('hh:mm:ss').format(DateTime.now()),
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),  
        );
      }
    );
  }
}

Widget imageSection = Container(
  child: Image.network(
    'https://media.istockphoto.com/id/1178017061/photo/woolly-mammoth-set-in-a-winter-scene-environment-16-9-panoramic-format.jpg?s=612x612&w=0&k=20&c=nYVvqx3LSYZjVjCCpb9qlVdnYXbb47jPAmEdW-Cf7VM=',
    fit: BoxFit.contain,
  ),
);

Widget enTextSection = Container(
  child: FittedBox(
    child: Text(
      'How much did they pay you to give up on your dreams?',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),          
  ),
);

Widget chTextSection = Container(
  child: FittedBox(
    child: Text(
      '他們付了你多少錢，讓你放棄了你的夢想？',
      style: TextStyle(color: Colors.grey)
    ),
  ),
);
