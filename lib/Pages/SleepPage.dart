import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SleepPage extends StatefulWidget {


  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {

  double max_value=8;
  double sum=0;
  double slider_value = 0;
  double control = 0;
  final sleep_controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            SafeArea(
              child
                  : Container(
                  height: 80,
                  width: 80,
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

            //SizedBox(height: 100),


            SizedBox(width: 10,),
            Text(
              "Uyku Bilgisi",
              style: TextStyle(
                color: Colors.purple[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: SleekCircularSlider(
                initialValue: slider_value, // Initial value
                max: max_value, // Maximum value
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                    progressBarColor: Colors.purple, // Customize progress bar colors
                    trackColor: Colors.grey, // Customize track color
                    shadowColor: Colors.purple, // Customize shadow color
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
                    mainLabelStyle: TextStyle(fontSize: 24, color: Colors.purple),
                    modifier: (double value) {
                      // Display value as a percentage
                      return '${sum.toStringAsFixed(0)}/${max_value.toStringAsFixed(0)} saat';
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent,
                  )


              ),
              onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: Text("Antrenman Girişi"),
                      content: TextField(
                        controller: sleep_controller,
                        decoration: InputDecoration(
                          hintText: "Uyku sürenizi giriniz(saat)",

                        ),

                      ),
                      actions: [
                        TextButton(
                          onPressed:(){
                            setState(() {
                              if((double.parse(sleep_controller.text))>=max_value){
                                slider_value=max_value;
                                sum=double.parse(sleep_controller.text);
                                Navigator.of(context).pop(slider_value);


                              }
                              else{
                                slider_value = double.parse(sleep_controller.text);
                                sum=slider_value;
                                Navigator.of(context).pop(slider_value);
                              }
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
                              else{
                                control=0;
                              }

                            });

                          },


                          child: Text("Ekle"),
                        )
                      ],
                    ),
                  );
                });

              },
              child: Icon(
                  color: Colors.white,
                  Icons.add,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Günlük Hedef: ${max_value.toInt()} saat",
              style: TextStyle(
                color: Colors.purple[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Toplam uyku süresi: ${(sum.toInt())} saat ",
              style: TextStyle(
                color: Colors.purple[800],
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
