class BookingResponse {
  String? message;
  Order? order;

  BookingResponse({this.message, this.order});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  String? customerId;
  String? serviceId;
  String? orderId;
  String? address;
  String? city;
  String? age;
  String? postalCode;
  String? additionalInformation;
  String? longitude;
  String? latitude;
  String? bookingDate;
  String? bookingTime;
  String? paymentStatus;
  String? amountPaid;
  String? updatedAt;
  String? createdAt;
  int? id;

  Order({
    this.customerId,
    this.serviceId,
    this.orderId,
    this.address,
    this.city,
    this.age,
    this.postalCode,
    this.additionalInformation,
    this.longitude,
    this.latitude,
    this.bookingDate,
    this.bookingTime,
    this.paymentStatus,
    this.amountPaid,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Order.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    orderId = json['order_id'];
    address = json['address'];
    city = json['city'];
    age = json['age'];
    postalCode = json['postal_code'];
    additionalInformation = json['additional_information'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    paymentStatus = json['payment_status'];
    amountPaid = json['amount_paid'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['service_id'] = serviceId;
    data['order_id'] = orderId;
    data['address'] = address;
    data['city'] = city;
    data['age'] = age;
    data['postal_code'] = postalCode;
    data['additional_information'] = additionalInformation;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['booking_date'] = bookingDate;
    data['booking_time'] = bookingTime;
    data['payment_status'] = paymentStatus;
    data['amount_paid'] = amountPaid;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
