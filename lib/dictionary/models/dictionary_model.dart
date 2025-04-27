import 'dart:convert';

List<DictionaryModel> DictionaryModelFromJson(String str) => List<DictionaryModel>.from(json.decode(str).map((x) => DictionaryModel.fromJson(x)));

String DictionaryModelToJson(List<DictionaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class DictionaryModel {
    DictionaryModel({
        required this.word,
        required this.phonetic,
        required this.phonetics,
        required this.meanings,
        required this.license,
        required this.sourceUrls,
    });

    final String? word;
    static const String wordKey = "word";
    
    final String? phonetic;
    static const String phoneticKey = "phonetic";
    
    final List<Phonetic> phonetics;
    static const String phoneticsKey = "phonetics";
    
    final List<Meaning> meanings;
    static const String meaningsKey = "meanings";
    
    final License? license;
    static const String licenseKey = "license";
    
    final List<String> sourceUrls;
    static const String sourceUrlsKey = "sourceUrls";
    

    DictionaryModel copyWith({
        String? word,
        String? phonetic,
        List<Phonetic>? phonetics,
        List<Meaning>? meanings,
        License? license,
        List<String>? sourceUrls,
    }) {
        return DictionaryModel(
            word: word ?? this.word,
            phonetic: phonetic ?? this.phonetic,
            phonetics: phonetics ?? this.phonetics,
            meanings: meanings ?? this.meanings,
            license: license ?? this.license,
            sourceUrls: sourceUrls ?? this.sourceUrls,
        );
    }

    factory DictionaryModel.fromJson(Map<String, dynamic> json){ 
        return DictionaryModel(
            word: json["word"],
            phonetic: json["phonetic"],
            phonetics: json["phonetics"] == null ? [] : List<Phonetic>.from(json["phonetics"]!.map((x) => Phonetic.fromJson(x))),
            meanings: json["meanings"] == null ? [] : List<Meaning>.from(json["meanings"]!.map((x) => Meaning.fromJson(x))),
            license: json["license"] == null ? null : License.fromJson(json["license"]),
            sourceUrls: json["sourceUrls"] == null ? [] : List<String>.from(json["sourceUrls"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": phonetics.map((x) => x?.toJson()).toList(),
        "meanings": meanings.map((x) => x?.toJson()).toList(),
        "license": license?.toJson(),
        "sourceUrls": sourceUrls.map((x) => x).toList(),
    };

}

class License {
    License({
        required this.name,
        required this.url,
    });

    final String? name;
    static const String nameKey = "name";
    
    final String? url;
    static const String urlKey = "url";
    

    License copyWith({
        String? name,
        String? url,
    }) {
        return License(
            name: name ?? this.name,
            url: url ?? this.url,
        );
    }

    factory License.fromJson(Map<String, dynamic> json){ 
        return License(
            name: json["name"],
            url: json["url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };

}

class Meaning {
    Meaning({
        required this.partOfSpeech,
        required this.definitions,
        required this.synonyms,
        required this.antonyms,
    });

    final String? partOfSpeech;
    static const String partOfSpeechKey = "partOfSpeech";
    
    final List<Definition> definitions;
    static const String definitionsKey = "definitions";
    
    final List<String> synonyms;
    static const String synonymsKey = "synonyms";
    
    final List<String> antonyms;
    static const String antonymsKey = "antonyms";
    

    Meaning copyWith({
        String? partOfSpeech,
        List<Definition>? definitions,
        List<String>? synonyms,
        List<String>? antonyms,
    }) {
        return Meaning(
            partOfSpeech: partOfSpeech ?? this.partOfSpeech,
            definitions: definitions ?? this.definitions,
            synonyms: synonyms ?? this.synonyms,
            antonyms: antonyms ?? this.antonyms,
        );
    }

    factory Meaning.fromJson(Map<String, dynamic> json){ 
        return Meaning(
            partOfSpeech: json["partOfSpeech"],
            definitions: json["definitions"] == null ? [] : List<Definition>.from(json["definitions"]!.map((x) => Definition.fromJson(x))),
            synonyms: json["synonyms"] == null ? [] : List<String>.from(json["synonyms"]!.map((x) => x)),
            antonyms: json["antonyms"] == null ? [] : List<String>.from(json["antonyms"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": definitions.map((x) => x?.toJson()).toList(),
        "synonyms": synonyms.map((x) => x).toList(),
        "antonyms": antonyms.map((x) => x).toList(),
    };

}

class Definition {
    Definition({
        required this.definition,
        required this.synonyms,
        required this.antonyms,
        required this.example,
    });

    final String? definition;
    static const String definitionKey = "definition";
    
    final List<dynamic> synonyms;
    static const String synonymsKey = "synonyms";
    
    final List<dynamic> antonyms;
    static const String antonymsKey = "antonyms";
    
    final String? example;
    static const String exampleKey = "example";
    

    Definition copyWith({
        String? definition,
        List<dynamic>? synonyms,
        List<dynamic>? antonyms,
        String? example,
    }) {
        return Definition(
            definition: definition ?? this.definition,
            synonyms: synonyms ?? this.synonyms,
            antonyms: antonyms ?? this.antonyms,
            example: example ?? this.example,
        );
    }

    factory Definition.fromJson(Map<String, dynamic> json){ 
        return Definition(
            definition: json["definition"],
            synonyms: json["synonyms"] == null ? [] : List<dynamic>.from(json["synonyms"]!.map((x) => x)),
            antonyms: json["antonyms"] == null ? [] : List<dynamic>.from(json["antonyms"]!.map((x) => x)),
            example: json["example"],
        );
    }

    Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": synonyms.map((x) => x).toList(),
        "antonyms": antonyms.map((x) => x).toList(),
        "example": example,
    };

}

class Phonetic {
    Phonetic({
        required this.text,
        required this.audio,
        required this.sourceUrl,
        required this.license,
    });

    final String? text;
    static const String textKey = "text";
    
    final String? audio;
    static const String audioKey = "audio";
    
    final String? sourceUrl;
    static const String sourceUrlKey = "sourceUrl";
    
    final License? license;
    static const String licenseKey = "license";
    

    Phonetic copyWith({
        String? text,
        String? audio,
        String? sourceUrl,
        License? license,
    }) {
        return Phonetic(
            text: text ?? this.text,
            audio: audio ?? this.audio,
            sourceUrl: sourceUrl ?? this.sourceUrl,
            license: license ?? this.license,
        );
    }

    factory Phonetic.fromJson(Map<String, dynamic> json){ 
        return Phonetic(
            text: json["text"],
            audio: json["audio"],
            sourceUrl: json["sourceUrl"],
            license: json["license"] == null ? null : License.fromJson(json["license"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
        "sourceUrl": sourceUrl,
        "license": license?.toJson(),
    };

}
