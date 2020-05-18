import 'package:flutter/material.dart';

@immutable
class VQuotes{
  final String body;
  final String chapter;
  VQuotes({this.body, this.chapter});
  factory VQuotes.fromJson(Map<String, dynamic> json){
    return VQuotes(
      body: json['V'],
      chapter: json['Chapter']
    );
  }
}
