class BreedModel {
  String? name;
  String? subName;

  BreedModel({ this.name, this.subName});

  @override
  String toString() => subName != null ? '$name  $subName' : '$name';
}

