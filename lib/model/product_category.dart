class ProductCategory {
  final int? categoryId;
  final String? name;
  final String? displayName;
  final String? slug;
  final String? type;
  final String? iconUrl;

  ProductCategory({
    this.categoryId,
    this.name,
    this.displayName,
    this.slug,
    this.type,
    this.iconUrl,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      categoryId: json['category_id'],
      name: json['name'],
      displayName: json['display_name'],
      slug: json['slug'],
      type: json['type'],
      iconUrl: json['icon_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'display_name': displayName,
      'slug': slug,
      'type': type,
      'icon_url': iconUrl,
    };
  }
}
