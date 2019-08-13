import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';

class EnglishWords extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final wordPair = new prefix0.WordPair.random();
    return Padding(
  
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }

}