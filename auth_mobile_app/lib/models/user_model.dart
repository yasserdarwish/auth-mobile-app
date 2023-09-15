class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String gender;
  final String image;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.username,
      required this.gender,
      required this.image,
      required this.id});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        username: data['username'],
        gender: data['gender'],
        image: data['image'],
        id: data['id']);
  }
}
