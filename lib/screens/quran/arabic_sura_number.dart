import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';


class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key,required this.i}) : super(key: key);
    final int i;

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    arabicNumber.convert(7);
    return Text("\uFD3E"+arabicNumber.convert((i+1)).toString()+"\uFD3F", style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'fonts/me_quran',
        fontSize: 20,
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ]),);
  }
}
