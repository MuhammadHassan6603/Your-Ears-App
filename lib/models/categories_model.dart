class CategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  CategoriesModel(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
