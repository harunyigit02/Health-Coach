import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:yeniflutter/Main_Page.dart';


class WaterPage extends StatefulWidget {

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  ValueNotifier<double> slider_degeri = ValueNotifier<double>(0.0);
  double max_value=10;
  double sum=0;
  double slider_value = 0;
  double control = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                      },
                      child: Icon(
                        Icons.arrow_back_sharp
                      )
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
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


            Text(
              "Su Bilgisi",
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: SleekCircularSlider(
                initialValue: slider_degeri.value, // Initial value
                max: max_value, // Maximum value
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                    progressBarColor: Colors.blue, // Customize progress bar colors
                    trackColor: Colors.grey, // Customize track color
                    shadowColor: Colors.blue, // Customize shadow color
                    shadowMaxOpacity: 0.2, // Set shadow maximum opacity
                  ),
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 20, // Set progress bar width
                    trackWidth: 20, // Set track width
                    shadowWidth: 20, // Set shadow width
                  ),
                  size: 300, // Set the slider's size
                  startAngle: 200, // Set the starting angle
                  angleRange: 350, // Set the angle range
                  infoProperties: InfoProperties(
                    // Customize label style
                    mainLabelStyle: TextStyle(fontSize: 24, color: Colors.blue),
                    modifier: (double value) {
                      // Display value as a percentage
                      return '${sum.toStringAsFixed(0)}/${max_value.toStringAsFixed(0)} bardak';
                    },
                  ),
                  spinnerMode: false, // Disable spinner mode
                  animationEnabled: true, // Enable animation
                ),
                onChange: null,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue,
              )


              ),
              onPressed: (){

                if(slider_degeri.value==max_value){
                  slider_degeri.value=max_value;
                  sum+=1;
                }
                else{
                  slider_degeri.value+=1;
                  sum+=1;
                }
              setState(() {
                slider_value;
                if(slider_value==max_value && control==0){
                  control=1;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Tebrikler!'),
                        content: Text('Hedefe Ulaştınız'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Dialog penceresini kapatmak için
                            },
                            child: Text('Tamam'),
                          ),
                        ],
                      );
                    },
                  );

                }
              }
              );
            },
                child: Icon(
                  color: Colors.white,
                    Icons.add
                ),
            ),
            SizedBox(height: 20),
            Text(
              "Günlük Hedef: ${max_value.toInt()}",
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Su içilen toplam bardak sayısı: ${(sum.toInt())} ",
              style: TextStyle(
                color: Colors.blue[800],
                fontWeight:FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );




  }
}
