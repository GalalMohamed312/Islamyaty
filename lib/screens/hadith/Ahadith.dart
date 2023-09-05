
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamyat/screens/hadith/showHadith.dart';


import '../../db/mydata.dart';
import '../../model/hadithe.dart';
import '../../utils/app_strings.dart';

class AllAhadithScreen extends StatefulWidget {
  const AllAhadithScreen({super.key});

  @override
  State<AllAhadithScreen> createState() => _AllAhadithScreenState();
}

class _AllAhadithScreenState extends State<AllAhadithScreen> {


  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset("assets/images/grey.svg"),
        // Image.asset("assets/images/window_grey.png"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(key,style: const TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold),),
            Text(name,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.yellow),textScaleFactor: .5,),
          ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child:Stack (textDirection: TextDirection.rtl,
              children: [
                // SvgPicture.asset("assets/images/background.svg",width: double.infinity,height: double.infinity,),
                SvgPicture.asset("assets/images/background.svg",width: double.infinity,fit: BoxFit.fill,),
                const Column(textDirection:TextDirection.rtl ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: ,),
                    TextApp.topHomeScreen,
                    TextApp.headerHomeScreen,
                  ],
                ),
              ],
            ),),
            Expanded(
              child:  Stack  (
              children: [
                // SvgPicture.asset("assets/images/background.svg",width: double.infinity,fit: BoxFit.cover,),
                FutureBuilder(
                  //we call the method, which is in the folder db file database.dart
                    future: MyData.getAllData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            //delete one register for id
                            return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewHadith(hadith: item,)));
                                },
                                child: ayah('${item.key}', item.nameHadith));
                          },
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 20,
                            childAspectRatio: 3/2,),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),),
          ],
        ),
      ),



    );
  }
}
