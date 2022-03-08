class Photos {
  int id;
  String url;
  String title;
  Photos(
      this.id, this.title, this.url);
  factory Photos.fromJson(dynamic json) {
    return Photos(
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
    );
  }
  @override
  String toString() {
    return '{ $id, $title,$url}';
  }
}
