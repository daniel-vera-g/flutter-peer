class User {
  String name;
  String email;
  String uid;
  String profilePictureUrl;

  User({this.name, this.email, this.uid, this.profilePictureUrl});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        uid = json['uid'],
        email = json['email'],
        profilePictureUrl = json['profilePictureUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'profilePictureUrl': profilePictureUrl,
        'email': email,
      };
}
