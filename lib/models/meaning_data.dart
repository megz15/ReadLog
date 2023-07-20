class MeaningData {
  List<dynamic> meanings;
  List<dynamic> phonetics;

  MeaningData({required this.meanings, required this.phonetics});

  factory MeaningData.fromJSON(dynamic json) {
    return MeaningData(meanings: json["meanings"] ?? [], phonetics: json["phonetics"] ?? []);
  }
}
