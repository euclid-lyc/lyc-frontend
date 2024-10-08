class User {
  final String memberId;
  final String nickname;
  final String loginId;
  final String profileImage;
  final int follower;
  final int following;

  User(this.memberId, this.nickname, this.loginId, this.profileImage,
      this.follower, this.following);
}
