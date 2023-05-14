import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kemet/models/place_hint.dart';
import 'dart:convert';

class PlaceInPost {
  String type = 'place';
  PlaceHint? placeHint;
  TextEditingController searchController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  toJson(index) {
    if (placeHint == null) {
      return null;
    }
    return {
      "type": type,
      "p_id": placeHint!.id,
      "content": commentController.text,
      "index": index,
    };
  }
}

class TextInPost {
  String type = "text";
  TextEditingController controller = TextEditingController();

  toJson(index) {
    if (controller.text.isEmpty) {
      return null;
    }
    return {
      "type": type,
      "content": controller.text,
      "index": index,
    };
  }
}

class ImageInPost {
  String type = "image";
  XFile image;
  ImageInPost(this.image);

  Future<Map<String, dynamic>> toJson(index) async {
    /*List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64.encode(imageBytes);*/
    return {
      "type": type,
      "image": await image.readAsString(),
      "index": index,
    };
  }
}
