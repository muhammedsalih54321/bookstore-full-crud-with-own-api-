
class Bookstoremodel4 {
    String? message;

    Bookstoremodel4({this.message});

    Bookstoremodel4.fromJson(Map<String, dynamic> json) {
        if(json["message"] is String) {
            message = json["message"];
        }
    }

    static List<Bookstoremodel4> fromList(List<Map<String, dynamic>> list) {
        return list.map(Bookstoremodel4.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        return _data;
    }

    Bookstoremodel4 copyWith({
        String? message,
    }) => Bookstoremodel4(
        message: message ?? this.message,
    );
}