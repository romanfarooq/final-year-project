enum Role { user, workshop }

class OwnerInfo {
  String name;
  int id;
  String email;
  String phone;
  String password;
  Role role;

  //Car or Workshop

  //constructor
  OwnerInfo({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });
}
