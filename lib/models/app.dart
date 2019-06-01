class App {
  String name;
  String description;
  String category;
  String link;

  String owner;
  String ownerName;

  App(this.name, this.description, this.category, this.link, this.owner);

  App.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        category = json['category'],
        link = json['link'],
        ownerName = json['ownerName'],
        owner = json['owner'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'link': link,
        'ownerName': ownerName,
        'owner': owner,
      };
}
