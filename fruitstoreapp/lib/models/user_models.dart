class User {
  int? id;
  String? username;
  String? email;
  String? image;

  User({this.id, this.username, this.email, this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      image: json['image'],
    );
  }
}
