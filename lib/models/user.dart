class User {
  String name;
  String email;
  String uid;
  String profilePictureUrl;

  User({this.name, this.uid, this.profilePictureUrl});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        uid = json['uid'],
        profilePictureUrl = json['profilePictureUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'profilePictureUrl': profilePictureUrl,
      };
}
