import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Main_Page.dart';
import 'Auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp( MyApp());
}

int a = 1;
double max_value = 100;
double max_value2 = 100;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlık Koçu',
      theme: ThemeData(
        primarySwatch: Colors.red,
        sliderTheme: SliderThemeData(
          thumbColor: Colors.red, // Slider'ın başparmağı rengi
          activeTrackColor: Colors.yellow, // Slider'ın etkin iz rengi
          inactiveTrackColor:
          Colors.red.withOpacity(0.5), // Slider'ın etkisiz iz rengi
          overlayColor:
          Colors.red.withOpacity(0.3), // Slider'ın üstüne açılan renk
        ),
        useMaterial3: true,
      ),
      home: SecondPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0.0;
  double _sliderValue2 = 0.0;
  final mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Su İçme Takip Sayfası'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Slider Değeri: $_sliderValue'),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SliderTheme(
                          data: SliderThemeData(
                              disabledActiveTrackColor: Colors.blue,
                              disabledInactiveTrackColor:
                              Colors.blue.withOpacity(0.1),
                              thumbColor: Colors.blue,
                              // Slider'ın başparmağı rengi
                              activeTrackColor: Colors.blue,
                              // Slider'ın etkin iz rengi
                              inactiveTrackColor: Colors.blue.withOpacity(0.2),
                              // Slider'ın etkisiz iz rengi
                              overlayColor: Colors.blue.withOpacity(0.1),
                              // Slider'ın üstüne açılan renk
                              trackHeight: 70.0,
                              // Slider izi kalınlığı
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 0.0),
                              // Başparmak şekli
                              overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0),
                              trackShape: RoundedRectSliderTrackShape()
                            // Üstüne açılan şekil
                          ),
                          child: Container(
                            height: 300,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Slider(
                                  value: _sliderValue,
                                  min: 0,
                                  max: max_value,
                                  divisions: null,
                                  // Opsiyonel: Slider'ı bölümlere ayırır
                                  label: '$_sliderValue',
                                  // Opsiyonel: Slider'ın değeri etiketlenir
                                  onChanged: null),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_sliderValue >= max_value) {
                              _sliderValue = max_value;
                            } else {
                              _sliderValue = _sliderValue + 10 ?? 0.0;
                              _sliderValue2 = _sliderValue / 2;
                              a = int.tryParse(mycontroller.text) ?? 0;
                            }
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_sliderValue <= 0) {
                                _sliderValue = 0;
                              } else {
                                _sliderValue = _sliderValue - 10 ?? 0.0;
                                _sliderValue2 = _sliderValue / 2;
                              }
                            });
                          },
                          child: Icon(Icons.remove))
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  });
                },
                child: Icon(Icons.arrow_forward_ios_outlined)),
            Expanded(
              child: Container(
                width: 60,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: mycontroller,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
