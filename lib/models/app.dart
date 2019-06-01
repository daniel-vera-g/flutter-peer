class App {
  final String name;
  final String description;
  final String category;
  final String link;

  App(this.name, this.description, this.category, this.link);

  App.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        category = json['category'],
        link = json['link'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'link': link,
      };
}
