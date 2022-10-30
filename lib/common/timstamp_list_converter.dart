import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampListConverter
    implements JsonConverter<List<DateTime>?, List<Timestamp>?> {
  const TimestampListConverter();

  @override
  List<DateTime>? fromJson(List<dynamic>? json) {
    // TODO:Timestampをダイナミックにする
    if (json == null) return null;
    List<DateTime>? datatimeList = [];
    for (Timestamp timestamp in json) {
      datatimeList.add(timestamp.toDate());
    }
    return datatimeList;
  }

  @override
  List<Timestamp>? toJson(List<DateTime>? object) {
    if (object == null) return null;
    List<Timestamp>? timestampList = [];
    for (DateTime datetime in object) {
      timestampList.add(Timestamp.fromDate(datetime));
    }
    return timestampList;
  }
}
