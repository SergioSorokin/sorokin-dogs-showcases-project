class Breed {
  String name;
  List<dynamic> subName;

  Breed({required this.name, required this.subName});
  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
        name: json['name'] as String,
        subName: (json['subName'] )
            .map((dynamic e) => BreadSub.fromJson(e as Map<String, dynamic>))
            );
  }
}

class BreadSub {
  String sub;
  BreadSub({required this.sub});
  factory BreadSub.fromJson(Map<String, dynamic> json) {
    return BreadSub(sub: json['sub']);
  }
}
