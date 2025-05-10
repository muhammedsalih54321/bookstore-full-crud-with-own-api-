
class Bookstoremodel3 {
    String? message;

    Bookstoremodel3({this.message});

    Bookstoremodel3.fromJson(Map<String, dynamic> json) {
        if(json["message"] is String) {
            message = json["message"];
        }
    }

    static List<Bookstoremodel3> fromList(List<Map<String, dynamic>> list) {
        return list.map(Bookstoremodel3.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        return _data;
    }

    Bookstoremodel3 copyWith({
        String? message,
    }) => Bookstoremodel3(
        message: message ?? this.message,
    );
}