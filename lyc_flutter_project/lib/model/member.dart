class Member {
  final int id;
  final String login_id;
  final String login_pw;
  final String email;
  final String nickname;
  final String introduction;
  final String profile_image;
  final String stamp_no;
  final String created_at;
  final String inactive;
  final String point;
  final int follower;
  final int following;

  Member(
      this.id,
      this.login_id,
      this.login_pw,
      this.email,
      this.nickname,
      this.introduction,
      this.profile_image,
      this.stamp_no,
      this.created_at,
      this.inactive,
      this.point,
      this.follower,
      this.following);
}
