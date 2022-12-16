class GetProductDetails {
  int? id;
  String? code;
  String? name;
  String? slug;
  String? displayMode;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? status;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  GetProductDetails({
    this.id,
    this.code,
    this.name,
    this.slug,
    this.displayMode,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });
  GetProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    displayMode = json['display_mode']?.toString();
    description = json['description']?.toString();
    metaTitle = json['meta_title']?.toString();
    metaDescription = json['meta_description']?.toString();
    metaKeywords = json['meta_keywords']?.toString();
    status = json['status']?.toInt();
    imageUrl = json['image_url']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['slug'] = slug;
    data['display_mode'] = displayMode;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class GetProductDetailsModel {
  List<GetProductDetails>? data;
  GetProductDetailsModel({
    this.data,
  });
  GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <GetProductDetails>[];
      v.forEach((v) {
        arr0.add(GetProductDetails.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}
