
class Bookstoremodel2 {
    int? count;
    List<Data>? data;

    Bookstoremodel2({this.count, this.data});

    Bookstoremodel2.fromJson(Map<String, dynamic> json) {
        if(json["count"] is num) {
            count = (json["count"] as num).toInt();
        }
        if(json["data"] is List) {
            data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
        }
    }

    static List<Bookstoremodel2> fromList(List<Map<String, dynamic>> list) {
        return list.map(Bookstoremodel2.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["count"] = count;
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Bookstoremodel2 copyWith({
        int? count,
        List<Data>? data,
    }) => Bookstoremodel2(
        count: count ?? this.count,
        data: data ?? this.data,
    );
}

class Data {
    String? id;
    String? title;
    String? author;
    int? publishYear;
    String? createdAt;
    String? updatedAt;
    int? v;

    Data({this.id, this.title, this.author, this.publishYear, this.createdAt, this.updatedAt, this.v});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["_id"] is String) {
            id = json["_id"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
        if(json["author"] is String) {
            author = json["author"];
        }
        if(json["publishYear"] is num) {
            publishYear = (json["publishYear"] as num).toInt();
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

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map(Data.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["title"] = title;
        _data["author"] = author;
        _data["publishYear"] = publishYear;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        _data["__v"] = v;
        return _data;
    }

    Data copyWith({
        String? id,
        String? title,
        String? author,
        int? publishYear,
        String? createdAt,
        String? updatedAt,
        int? v,
    }) => Data(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        publishYear: publishYear ?? this.publishYear,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
    );
}