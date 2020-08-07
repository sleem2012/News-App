
import 'package:flutter/material.dart';

class PageModel {
  String _title;
  String _descriptions;
  IconData _icons;
  String _images;

  PageModel(this._title, this._descriptions, this._icons, this._images);

  String get images => _images;

  IconData get icons => _icons;

  String get descriptions => _descriptions;

  String get title => _title;


}