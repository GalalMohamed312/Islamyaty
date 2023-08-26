import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyat/screens/quran/index.dart';
import 'package:islamyat/screens/quran/surah_builder.dart';
import 'package:islamyat/utils/navigator.dart';

class Quran extends StatelessWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:IndexPage()),
    );
  }
}
