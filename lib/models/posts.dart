class Posts {
  String id;
  String title;
  String content;
  String urlImage;
  DateTime datePosted;

  Posts({
    this.id = "",
    this.title = "",
    this.content = "",
    this.urlImage = "",
    DateTime? ddatePosted,
  }) : datePosted = ddatePosted ?? DateTime(1990, 1, 1);
}
