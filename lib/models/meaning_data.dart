class MeaningData {
  // List<MeanDatMeaning> meanings;
  List<dynamic> meanings;
  List<dynamic> phonetics;

  MeaningData({required this.meanings, required this.phonetics});

  factory MeaningData.fromJSON(
      List<dynamic> meanings, List<dynamic> phonetics) {
    return MeaningData(
      // meanings: meanings.map((e) => MeanDatMeaning(
      //   partOfSpeech: e["partOfSpeech"],
      //   definitions: e["definitions"],
      //   synonyms: e["synonyms"],
      //   antonyms: e["antonyms"],
      // )).toList(),
      meanings: meanings,
      phonetics: phonetics,
    );
  }
}

// class MeanDatMeaning {
//   String partOfSpeech;
//   List<dynamic> definitions;
//   List<dynamic> synonyms;
//   List<dynamic> antonyms;

//   MeanDatMeaning({
//     required this.partOfSpeech,
//     required this.definitions,
//     required this.synonyms,
//     required this.antonyms,
//   });

//   factory MeanDatMeaning.fromJSON(String partOfSpeech, List<dynamic> definitions, List<dynamic> synonyms, List<dynamic> antonyms) {
//     return MeanDatMeaning(
//       partOfSpeech: partOfSpeech,
//       definitions: definitions,
//       synonyms: synonyms,
//       antonyms: antonyms,
//     );
//   }
// }
