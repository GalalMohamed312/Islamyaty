import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:islamyat/presentation/screens/quran/mydrawer.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';

import '../qiblah/qiblahCheckAvailable.dart';
import '../utils/assets.dart';
import '../utils/navigator.dart';
import 'Prayer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    var hijri=HijriCalendar.now();
    ArabicNumbers _arabicNumber = ArabicNumbers();
    return  Scaffold(
      backgroundColor: AppColors.background,
      drawer: const MyDrawer(),
      appBar: AppBar(// centerTitle: true,
        title: const Text(
          "إسلاميات",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Column(
              // textAlign: TextAlign.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // textDirection: TextDirection.rtl,
              children:[
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        child: Image.asset(ImageAssets.mosque,fit: BoxFit.fill,width: double.infinity,)),
                    Positioned(
                      bottom: 0,
                      left: 50,
                      child: RichText(
                          text: TextSpan(
                        children:<InlineSpan> [
                          WidgetSpan(child: Padding(padding: const EdgeInsets.all(AppSize.s4),
                            child: Text("${_arabicNumber.convert((hijri.hYear)).toString()} هجري ",style: const TextStyle(
                                fontSize: AppSize.s24,
                                color: AppColors.primaryColor
                            )),)),
                          WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
                            child: Text(hijri.longMonthName.toString(),style: const TextStyle(
                                fontSize: AppSize.s24,
                                color: AppColors.white
                            )),)),
                          WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
                            child: Text(_arabicNumber.convert((hijri.hDay)).toString(),style: const TextStyle(
                                fontSize: AppSize.s24,
                                color: AppColors.white
                            )),)),
                        ]
                      )),
                    ),
                  ],
                ),
                Prayer(),
                const SizedBox(height: 20,),
                 ElevatedButton(onPressed: (){
                   AppNavigator.push(context: context, screen: const QiblahCheckAvailable());
                 }, child:const Text("إتجاه القبله")),
              ],
            ),
          ),
        ),
      ),
    );

    /*
        return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('System Alert Window Example App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MaterialButton(
                onPressed: _showOverlayWindow,
                textColor: Colors.white,
                child: !_isShowingWindow
                    ? Text("Show system alert window")
                    : !_isUpdatedWindow
                    ? Text("Update system alert window")
                    : Text("Close system alert window"),
                color: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
            ),
          ],
        ),
      ),

    );

    */



    // return  Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(
    //         children:[
    //           RichText(text: TextSpan(
    //             children:<InlineSpan> [
    //               WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
    //               child: Text(hijri.hDay.toString(),style: const TextStyle(
    //                   fontSize: 16.0,
    //                   color: Colors.black
    //               )),)),
    //               WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
    //                 child: Text(hijri.longMonthName.toString(),style: const TextStyle(
    //                     fontSize: 16.0,
    //                     color: Colors.black
    //                 )),)),
    //               WidgetSpan(child: Padding(padding: const EdgeInsets.all(4),
    //                 child: Text("${hijri.hYear} AH",style: const TextStyle(
    //                     fontSize: 16.0,
    //                     color: Colors.black
    //                 )),)),
    //
    //             ]
    //           )),
    //            ElevatedButton(onPressed: (){
    //              AppNavigator.push(context: context, screen: QiblahCheckAvailable());
    //            }, child:Text("Quiblah")),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
