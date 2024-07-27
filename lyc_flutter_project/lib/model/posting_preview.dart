class PostingPreview {
  final String postingId;
  final String image;

  PostingPreview.fromJson(Map<String, dynamic> json)
      : postingId = json['postingId'],
        image = json['image'];
}