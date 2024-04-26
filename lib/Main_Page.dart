import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yeniflutter/Pages/WorkoutPage.dart';
import 'Pages/PedoMeterPage.dart';
import 'Pages/SleepPage.dart';
import 'Pages/WaterPage.dart';


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<double> slider_degeri1 = ValueNotifier<double>(0.0);

  double _sliderValue1 = 4.0;
  double _sliderValue2 = 3.0;
  double _sliderValue3 = 5.0;
  double _sliderValue4 = 2.0;
  double targetValue1 = 5.0;

  double max_value1 = 10;
  double max_value2 = 10;
  double max_value3 = 10;
  double max_value4 = 10;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Icon(
                Icons.account_circle,
                size: 200,
                color: Colors.grey[300],
              ),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text(
                    "Kullanıcı Bilgileri",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(width: 20,)
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WaterPage()));
                },
                child: Center(
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        border: Border.all(
                                          width: 4,
                                            color: Colors.blue
                                        ),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Icon(
                                        size: 70,
                                          color: Colors.blue,
                                          Icons.local_cafe_outlined
                                      )


                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    child: Text(
                                        "Su Bilgisi",
                                      style: TextStyle(
                                        fontSize: 30,
                                      )
                                    ),

                                  ),
                                ),
                              )
                            ],

                          ),
                        ),

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
                            trackHeight: 40.0,
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
                          height: 80,
                          child: Slider(
                              value: _sliderValue1,
                              min: 0,
                              max: max_value1,
                              divisions: null,
                              // Opsiyonel: Slider'ı bölümlere ayırır
                              label: '${slider_degeri1.value}',
                              // Opsiyonel: Slider'ın değeri etiketlenir
                              onChanged: null),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => WorkoutPage()));
          },
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.green[100],
                                      border: Border.all(
                                          width: 4,
                                          color: Colors.green
                                      ),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Icon(
                                      size: 70,
                                      color: Colors.lightGreen,
                                      Icons.fitness_center_outlined
                                  )


                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                child: Text(""
                                    "Antrenman Bilgisi",
                                    style: TextStyle(
                                      fontSize: 30,
                                    )
                                ),

                              ),
                            ),
                          )
                        ],

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SliderTheme(
                        data: SliderThemeData(
                            disabledActiveTrackColor: Colors.green,
                            disabledInactiveTrackColor:
                            Colors.green.withOpacity(0.1),
                            thumbColor: Colors.green,
                            // Slider'ın başparmağı rengi
                            activeTrackColor: Colors.green,
                            // Slider'ın etkin iz rengi
                            inactiveTrackColor: Colors.green.withOpacity(0.2),
                            // Slider'ın etkisiz iz rengi
                            overlayColor: Colors.green.withOpacity(0.1),
                            // Slider'ın üstüne açılan renk
                            trackHeight: 40.0,
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
                          height: 80,
                          child: Slider(
                              value: _sliderValue2,
                              min: 0,
                              max: max_value2,
                              divisions: null,
                              // Opsiyonel: Slider'ı bölümlere ayırır
                              label: '$_sliderValue2',
                              // Opsiyonel: Slider'ın değeri etiketlenir
                              onChanged: null),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SleepPage()));
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.purple[50],
                                          border: Border.all(
                                              width: 4,
                                              color: Colors.purple
                                          ),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Icon(
                                          size: 70,
                                          color: Colors.purple,
                                          Icons.nightlight_outlined
                                      )


                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    child: Text(""
                                        "Uyku Bilgisi",
                                        style: TextStyle(
                                          fontSize: 30,
                                        )
                                    ),

                                  ),
                                ),
                              )
                            ],

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SliderTheme(
                            data: SliderThemeData(
                                disabledActiveTrackColor: Colors.purple,
                                disabledInactiveTrackColor:
                                Colors.purple.withOpacity(0.1),
                                thumbColor: Colors.purple,
                                // Slider'ın başparmağı rengi
                                activeTrackColor: Colors.purple,
                                // Slider'ın etkin iz rengi
                                inactiveTrackColor: Colors.purple.withOpacity(0.2),
                                // Slider'ın etkisiz iz rengi
                                overlayColor: Colors.purple.withOpacity(0.1),
                                // Slider'ın üstüne açılan renk
                                trackHeight: 40.0,
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
                              height: 80,
                              child: Slider(
                                  value: _sliderValue3,
                                  min: 0,
                                  max: max_value3,
                                  divisions: null,
                                  // Opsiyonel: Slider'ı bölümlere ayırır
                                  label: '$_sliderValue3',
                                  // Opsiyonel: Slider'ın değeri etiketlenir
                                  onChanged: null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PedoMeterPage()));
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.red[50],
                                          border: Border.all(
                                              width: 4,
                                              color: Colors.red
                                          ),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Icon(
                                          size: 70,
                                          color: Colors.red,
                                          Icons.directions_walk_outlined,
                                      )


                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Container(
                                    child: Text(""
                                        "Adım Bilgisi",
                                        style: TextStyle(
                                          fontSize: 30,
                                        )
                                    ),

                                  ),
                                ),
                              )
                            ],

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SliderTheme(
                            data: SliderThemeData(
                                disabledActiveTrackColor: Colors.red,
                                disabledInactiveTrackColor:
                                Colors.red.withOpacity(0.1),
                                thumbColor: Colors.red,
                                // Slider'ın başparmağı rengi
                                activeTrackColor: Colors.red,
                                // Slider'ın etkin iz rengi
                                inactiveTrackColor: Colors.red.withOpacity(0.2),
                                // Slider'ın etkisiz iz rengi
                                overlayColor: Colors.red.withOpacity(0.1),
                                // Slider'ın üstüne açılan renk
                                trackHeight: 40.0,
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
                              height: 80,
                              child: Slider(
                                  value: _sliderValue2,
                                  min: 0,
                                  max: max_value4,
                                  divisions: null,
                                  // Opsiyonel: Slider'ı bölümlere ayırır
                                  label: '$_sliderValue2',
                                  // Opsiyonel: Slider'ın değeri etiketlenir
                                  onChanged: null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      )
      ,
    );
  }
}
