import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamyat/utils/navigator.dart';

import '../qiblah/qiblahCheckAvailable.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    var hijri=HijriCalendar.now();
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              RichText(text: TextSpan(
                children:<InlineSpan> [
                  WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
                  child: Text(hijri.hDay.toString(),style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black
                  )),)),
                  WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
                    child: Text(hijri.longMonthName.toString(),style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    )),)),
                  WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
                    child: Text("${hijri.hYear} AH",style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    )),)),

                ]
              )),
               ElevatedButton(onPressed: (){
                 AppNavigator.push(context: context, screen: QiblahCheckAvailable());
               }, child:Text("Quiblah")),
            ],
          ),
        ),
      ),
    );
  }
}
