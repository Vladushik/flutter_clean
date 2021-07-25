import 'dart:convert';

import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';

DatumModel datumModelFromJson(String str) =>
    DatumModel.fromJson(json.decode(str));

String datumModelToJson(DatumModel data) => json.encode(data.toJson());

class DatumModel extends Datum {
  DatumModel({
    required this.similarModel,
  }) : super(similar: similarModel);

  final SimilarModel similarModel;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        similarModel: SimilarModel.fromJson(json["Similar"]),
      );

  Map<String, dynamic> toJson() => {
        "Similar": similarModel.toJson(),
      };
}

class SimilarModel extends Similar {
  SimilarModel({
    required this.info,
    required this.results,
  }) : super(info: info, results: results);

  final List<InfoModel> info;
  final List<InfoModel> results;

  factory SimilarModel.fromJson(Map<String, dynamic> json) => SimilarModel(
        info: List<InfoModel>.from(
            json["Info"].map((x) => InfoModel.fromJson(x))),
        results: List<InfoModel>.from(
            json["Results"].map((x) => InfoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Info": List<dynamic>.from(info.map((x) => x.toJson())),
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class InfoModel extends Info {
  InfoModel({
    required this.name,
    required this.type,
  }) : super(name: name, type: type);

  final String name;
  final String type;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        name: json["Name"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Type": type,
      };
}
