import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../cubit/Cubit.dart';
import '../../cubit/states.dart';
import '../../model/hadithe.dart';
import '../../utils/navigator.dart';
import 'convertHadithStyle.dart';


class ViewHadith extends StatefulWidget{
  final Hadith hadith;

  ViewHadith({super.key, required this.hadith});

  @override
  State<ViewHadith> createState() => _ViewHadithState();
}

class _ViewHadithState extends State<ViewHadith> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _isTextVisible = false;
  bool _isButtonVisible=true;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, // Use `this` as the vsync parameter
      duration: Duration(milliseconds: 500),
    );
  }
  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
      _isButtonVisible = false;
    });

    if (_isTextVisible) {
      animationController.forward();
    } else {
      _isButtonVisible = true;
      animationController.reverse();
    }
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    return Scaffold(
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Text(widget.hadith.nameHadith!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          AppNavigator.pop(context: context);
                        },
                        child: const Icon(Icons.arrow_forward_ios,weight: 40,)),

                  ],
                ),
                const SizedBox(height: 20,),
                convertHadith(context,widget.hadith.textHadith!),
                const SizedBox(height: 20,),

                Visibility(
                    visible: _isButtonVisible,
                    child: ElevatedButton(
                    onPressed:_toggleTextVisibility, child: Text("تفسير الراوي",style: GoogleFonts.tajawal(color: Colors.black,fontWeight: FontWeight.bold,fontSize:25),)),
                ),
                AnimatedOpacity(
                  opacity: _isTextVisible ? 1.0 : 0.0,alwaysIncludeSemantics: true,
                  duration: const Duration(milliseconds: 500),
                  child:_isTextVisible ? convertHadith(context,widget.hadith.explanationHadith!):Text(""),
                ),
                Visibility(
                  visible: !_isButtonVisible,
                  child:ElevatedButton(
                      onPressed:_toggleTextVisibility, child: Text("إخفاء التفسير",style: GoogleFonts.tajawal(color: Colors.black,fontWeight: FontWeight.bold,fontSize:25),)),
                ),
                 ],
            ),
          ),
        ));
  }
}
