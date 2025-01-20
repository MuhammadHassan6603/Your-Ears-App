// class RegisterModel {
//   String? message;
//   User? user;
//   Customer? customer;
//   String? userProfilePic;
//   String? token;

//   RegisterModel(
//       {this.message,
//       this.user,
//       this.customer,
//       this.userProfilePic,
//       this.token});

//   RegisterModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     customer = json['customer'] != null
//         ? new Customer.fromJson(json['customer'])
//         : null;
//     userProfilePic = json['user_profile_pic'];
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     if (this.customer != null) {
//       data['customer'] = this.customer!.toJson();
//     }
//     data['user_profile_pic'] = this.userProfilePic;
//     data['token'] = this.token;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? roleAs;
//   String? emailVerifiedAt;
//   String? createdAt;
//   String? updatedAt;
//   Customer? customer;

//   User(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.roleAs,
//       this.emailVerifiedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.customer});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     roleAs = json['role_as'];
//     emailVerifiedAt = json['email_verified_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     customer = json['customer'] != null
//         ? new Customer.fromJson(json['customer'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['role_as'] = this.roleAs;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.customer != null) {
//       data['customer'] = this.customer!.toJson();
//     }
//     return data;
//   }
// }

// class Customer {
//   int? id;
//   int? userId;
//   String? profilePic;
//   String? city;
//   String? postalCode;
//   String? dateOfBirth;
//   String? createdAt;
//   String? updatedAt;

//   Customer(
//       {this.id,
//       this.userId,
//       this.profilePic,
//       this.city,
//       this.postalCode,
//       this.dateOfBirth,
//       this.createdAt,
//       this.updatedAt});

//   Customer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     profilePic = json['profile_pic'];
//     city = json['city'];
//     postalCode = json['postal_code'];
//     dateOfBirth = json['date_of_birth'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['profile_pic'] = this.profilePic;
//     data['city'] = this.city;
//     data['postal_code'] = this.postalCode;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class RegisterModel {
  String? message;
  User? user;
  String? token;

  RegisterModel({this.message, this.user, this.token});

  // Factory constructor to create an instance from JSON
  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }

  // CopyWith method
  RegisterModel copyWith({
    String? message,
    User? user,
    String? token,
  }) {
    return RegisterModel(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? profilePic;
  String? city;
  String? postalCode;
  String? dateOfBirth;
  int? _customer_id;

  int? get customer_id => _customer_id;

  set customer_id(int? value) {
    _customer_id = value;
  }


  User({
    this.name,
    this.email,
    this.phone,
    this.profilePic,
    this.city,
    this.postalCode,
    this.dateOfBirth,
    int? customer_id,
  }) : _customer_id = customer_id;

  // Factory constructor to create an instance from JSON
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profilePic = json['profile_pic'];
    city = json['city'];
    postalCode = json['postal_code'];
    dateOfBirth = json['date_of_birth'];
    customer_id = json['customer_id'];
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['profile_pic'] = profilePic;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['date_of_birth'] = dateOfBirth;
    data['customer_id'] = customer_id;
    return data;
  }

  // CopyWith method
  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? profilePic,
    String? city,
    String? postalCode,
    String? dateOfBirth,
    int? customer_id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePic: profilePic ?? this.profilePic,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      customer_id: customer_id ?? this.customer_id,
    );
  }
}
