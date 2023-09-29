import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return Container(
    // height: 200, // Adjust the height according to your needs
    // width: double.infinity, // Adjust the width according to your needs
    child: RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: TextStyle(fontSize: 20, color: Colors.brown),
        //style: DefaultTextStyle.of(context).style,
        children: [TextSpan(text: split.first), ...hadiths
            .map((text) => text.contains("{")
            ? TextSpan(text: text, style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
            : TextSpan(text: text))
            .toList()],
      ),
      textDirection: TextDirection.rtl,
    ),
  );
}
