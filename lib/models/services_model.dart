class ServicesModel {
  int? id;
  int? parentCategoryId;
  String? name;
  String? slug;
  String? description;
  String? unavailableDates;
  String? startTime;
  String? endTime;
  String? coupon;
  String? price;
  String? discountedPrice;
  String? image;
  String? active;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  ServicesModel(
      {this.id,
      this.parentCategoryId,
      this.name,
      this.slug,
      this.description,
      this.unavailableDates,
      this.startTime,
      this.endTime,
      this.coupon,
      this.price,
      this.discountedPrice,
      this.image,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentCategoryId = json['parent_category_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    unavailableDates = json['unavailable_dates'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    coupon = json['coupon'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    image = json['image'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_category_id'] = parentCategoryId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['unavailable_dates'] = unavailableDates;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['coupon'] = coupon;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['image'] = image;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
