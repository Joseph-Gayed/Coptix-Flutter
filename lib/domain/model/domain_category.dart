class DomainCategory {
  int? id;
  String? name;
  DomainCategory? parent;
  List<DomainCategory>? children;

  DomainCategory({
    this.id,
    this.name,
    this.parent,
    this.children,
  });

  factory DomainCategory.fromJson(Map<String, dynamic> json) => DomainCategory(
        id: json["id"],
        name: json["name"],
        parent: json["parent"] == null
            ? null
            : DomainCategory.fromJson(json["parent"]),
        children: json["children"] == null
            ? []
            : List<DomainCategory>.from(
                json["children"]!.map((x) => DomainCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent": parent?.toJson(),
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
      };
}
