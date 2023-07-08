class MeaningData {
  List<dynamic> meanings;
  List<dynamic> phonetics;

  MeaningData({required this.meanings, required this.phonetics});

  factory MeaningData.fromJSON(dynamic json) {
    // final meaningDataList = [];
    // for (var json in jsons) {
    return MeaningData(meanings: json["meanings"] ?? [], phonetics: json["phonetics"] ?? []);
    // }
    // return meaningDataList;
  }
}
