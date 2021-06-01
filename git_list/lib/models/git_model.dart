class GitModel {
  final String avatarUrl;
  final String fullName;
  final String? description;
  final int watchersCount;
  final String updatedAt;

  GitModel(
    this.avatarUrl,
    this.fullName,
    this.description,
    this.watchersCount,
    this.updatedAt,
  );

  static GitModel parse(Map<String, dynamic> json) {
    print("PARSING: $json");
    Map<String, dynamic> ownerJson = json['owner'];
    return GitModel(
      ownerJson['avatar_url'],
      json['full_name'],
      json['description'],
      json['watchers_count'],
      json['updated_at'],
    );
  }
}
