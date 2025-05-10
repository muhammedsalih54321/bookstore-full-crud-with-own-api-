
class Bookstoremodel1 {
    String? title;
    String? author;
    int? publishYear;
    String? id;
    String? createdAt;
    String? updatedAt;
    int? v;

    Bookstoremodel1({this.title, this.author, this.publishYear, this.id, this.createdAt, this.updatedAt, this.v});

    Bookstoremodel1.fromJson(Map<String, dynamic> json) {
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["author"] is String) {
            author = json["author"];
        }
        if(json["publishYear"] is num) {
            publishYear = (json["publishYear"] as num).toInt();
        }
        if(json["_id"] is String) {
            id = json["_id"];
        }
        if(json["createdAt"] is String) {
            createdAt = json["createdAt"];
        }
        if(json["updatedAt"] is String) {
            updatedAt = json["updatedAt"];
        }
        if(json["__v"] is num) {
            v = (json["__v"] as num).toInt();
        }
    }

    static List<Bookstoremodel1> fromList(List<Map<String, dynamic>> list) {
        return list.map(Bookstoremodel1.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        _data["author"] = author;
        _data["publishYear"] = publishYear;
        _data["_id"] = id;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        _data["__v"] = v;
        return _data;
    }

    Bookstoremodel1 copyWith({
        String? title,
        String? author,
        int? publishYear,
        String? id,
        String? createdAt,
        String? updatedAt,
        int? v,
    }) => Bookstoremodel1(
        title: title ?? this.title,
        author: author ?? this.author,
        publishYear: publishYear ?? this.publishYear,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
    );
}