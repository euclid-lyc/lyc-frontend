class Posting {
  final int id;
  final int max_temp;
  final int min_temp;
  final String style;
  final int like;
  final String created_at;
  final String content;
  final int from_id;
  final int to_id;
  final int writer_id;

  Posting(this.id, this.max_temp, this.min_temp, this.style, this.like,
      this.created_at, this.content, this.from_id, this.to_id, this.writer_id);
}
