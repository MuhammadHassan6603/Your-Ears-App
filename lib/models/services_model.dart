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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_category_id'] = this.parentCategoryId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['unavailable_dates'] = this.unavailableDates;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['coupon'] = this.coupon;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['image'] = this.image;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
