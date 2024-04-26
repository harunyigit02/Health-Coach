import'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class WorkoutPage extends StatefulWidget {


  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  double max_value=60;
  double sum=0;
  double slider_value = 0;
  double control = 0;
  final workout_controller=TextEditingController();


  void SliderOperations(){
    setState(() {
      if (slider_value == max_value-1) {
        slider_value=0;
        sum+=1;
        if(control==0){
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

      } else {
        slider_value = slider_value + 1 ?? 0.0;
        sum+=1;
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 50,),
            Center(
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


            Text(
              "Antrenman Bilgisi",
              style: TextStyle(
                color: Colors.green[800],
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
                    progressBarColor: Colors.green, // Customize progress bar colors
                    trackColor: Colors.grey, // Customize track color
                    shadowColor: Colors.green, // Customize shadow color
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
                    mainLabelStyle: TextStyle(fontSize: 24, color: Colors.green),
                    modifier: (double value) {
                      // Display value as a percentage
                      return '${sum.toStringAsFixed(0)}/${max_value.toStringAsFixed(0)} dakika';
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
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen,
                  )


              ),
              onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Antrenman Girişi"),
                    content: TextField(
                      controller: workout_controller,
                      decoration: InputDecoration(
                        hintText: "Antrenman süreni giriniz(dk)",

                      ),

                    ),
                    actions: [
                      TextButton(
                          onPressed:(){
                            setState(() {
                              if((sum+double.parse(workout_controller.text))>=max_value){
                                slider_value=max_value;
                                sum+=double.parse(workout_controller.text);
                                Navigator.of(context).pop(slider_value);


                              }
                              else{
                                slider_value += double.parse(workout_controller.text);
                                sum+=slider_value;
                                Navigator.of(context).pop(slider_value);
                              }
                              if(slider_value>=max_value && control==0){
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

                            });

                          },


                          child: Text("Ekle"),
                      )
                    ],
                  );
                });

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
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "Toplam yapılan antrenman süresi: ${(sum.toInt())} ",
              style: TextStyle(
                color: Colors.green[800],
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
