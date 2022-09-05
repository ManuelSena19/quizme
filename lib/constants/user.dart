
class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
});

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? password,
    String? about,
}) => User (
    imagePath: imagePath ?? this.imagePath,
    name: name ?? this.name,
    email: email ?? this.email,
    about: about ?? this.about
  );

  Map<String, dynamic> toJson() => {
    'imagePath' : imagePath,
    'name' : name,
    'email' : email,
    'about' :about,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    email: json['email'],
    about: json['about'],
  );

}