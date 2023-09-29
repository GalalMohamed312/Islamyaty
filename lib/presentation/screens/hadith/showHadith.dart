import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamyat/presentation/utils/app_colors.dart';
import 'package:islamyat/presentation/utils/styles_manager.dart';
import 'package:islamyat/presentation/utils/values_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../../model/hadithe.dart';
import '../../utils/navigator.dart';
import 'convertHadithStyle.dart';


class ViewHadith extends StatefulWidget{
  final Hadith hadith;

  const ViewHadith({super.key, required this.hadith});

  @override
  State<ViewHadith> createState() => _ViewHadithState();
}

class _ViewHadithState extends State<ViewHadith> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _isTextVisible = false;
  bool _isButtonVisible=true;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this, // Use `this` as the vsync parameter
      duration: const Duration(milliseconds: 500),
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
    onPressed: () {
          AppNavigator.pop(context: context);
    },),
        title:Text(widget.hadith.nameHadith!,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 1,
          style:textStyleBold(fontSize: AppSize.s24,color: AppColors.white))
      ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                convertHadith(context,widget.hadith.textHadith!),
                const SizedBox(height: 20,),

                Visibility(
                    visible: _isButtonVisible,
                    child: ElevatedButton(
                    onPressed:_toggleTextVisibility, child: Text("تفسير الراوي",style: textStyleBold(color: AppColors.white,fontSize: AppSize.s20)))
                    // GoogleFonts.tajawal(color: Colors.black,fontWeight: FontWeight.bold,fontSize:25),)),
                ),
                AnimatedOpacity(
                  opacity: _isTextVisible ? 1.0 : 0.0,alwaysIncludeSemantics: true,
                  duration: const Duration(milliseconds: 500),
                  child:_isTextVisible ? convertHadith(context,widget.hadith.explanationHadith!):Text(""),
                ),
                Visibility(
                  visible: !_isButtonVisible,
                  child:ElevatedButton(
                      onPressed:_toggleTextVisibility, child: Text("إخفاء التفسير",style: textStyleBold(color: AppColors.white,fontSize: AppSize.s20))),
                ),
                 ],
            ),
          ),
        ));
  }
}
