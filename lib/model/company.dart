class Company {
  final String name;
  final String email;

  Company({required this.name, required this.email});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
