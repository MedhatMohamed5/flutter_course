class Post {
  String id;
  String title;
  String content;
  String dateWritten;
  String featuredImage;
  int votesUp, votesDown;
  String userId;
  String categoryId;
  List<int> votersUp, votersDown;

  Post(
      {this.id,
      this.title,
      this.content,
      this.dateWritten,
      this.featuredImage,
      this.votesUp,
      this.votesDown,
      this.userId,
      this.votersDown,
      this.votersUp,
      this.categoryId});
}
