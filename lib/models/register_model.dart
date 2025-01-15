class RegisterModel {
  String? message;
  User? user;
  Customer? customer;
  String? token;

  RegisterModel({this.message, this.user, this.customer, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? phone;
  String? updatedAt;
  String? createdAt;
  int? id;
  Customer? customer;

  User(
      {this.name,
      this.email,
      this.phone,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.customer});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  int? userId;
  String? profilePic;
  String? city;
  String? postalCode;
  String? dateOfBirth;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
      this.userId,
      this.profilePic,
      this.city,
      this.postalCode,
      this.dateOfBirth,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    profilePic = json['profile_pic'];
    city = json['city'];
    postalCode = json['postal_code'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['profile_pic'] = profilePic;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['date_of_birth'] = dateOfBirth;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
