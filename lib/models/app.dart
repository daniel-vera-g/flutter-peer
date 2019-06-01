class App {
  String name;
  String description;
  String category;
  String link;

  String owner;
  String ownerName;

  String appIconUrl;
  List<String> screenshotUrls;

  int votes;

  List<String> following;

  App(
      {this.name,
      this.description,
      this.category,
      this.link,
      this.owner,
      this.appIconUrl});

  App.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        category = json['category'],
        link = json['link'],
        ownerName = json['ownerName'],
        appIconUrl = json['appIconUrl'],
        screenshotUrls = List<String>.from(['screenshotUrls']),
        votes = json['votes'],
        following = List<String>.from(['following']),
        owner = json['owner'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'category': category,
        'link': link,
        'ownerName': ownerName,
        'owner': owner,
        'appIconUrl': appIconUrl,
        'screenshotUrls': screenshotUrls,
        'votes': votes,
        'following': following,
      };
}
