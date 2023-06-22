class MeaningData {
  List<Map<String, dynamic>> meanings;
  List<Map<String, dynamic>> phonetics;

  MeaningData({required this.meanings, required this.phonetics});

  factory MeaningData.fromJSON(Map<String, dynamic> json) => MeaningData(
      meanings: json['meanings'] ?? [], phonetics: json['phonetics'] ?? []);
}
