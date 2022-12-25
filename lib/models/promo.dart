class Promo {
  String bgImg;
  String icon;
  String name;
  num score;
  num download;
  num review;
  String desc;
  List<String> imgs;

  Promo(
    this.bgImg,
    this.icon,
    this.name,
    this.score,
    this.download,
    this.review,
    this.desc,
    this.imgs,
  );

  static List<Promo> generetePromos() {
    return [
      Promo(
        "assets/images/ori1.jpg",
        "assets/images/ori_logo.png",
        "Ori and The Blind Forest",
        4.1,
        382,
        324,
        "jhfaowiehraiuhtiue",
        [
          "assets/images/ori2.jpg",
          "assets/images/ori3.jpg",
          "assets/images/ori4.jpg",
          "assets/images/ori5.jpg",
        ],
      ),
      Promo(
        "assets/images/rl1.jpg",
        "assets/images/rl_logo.png",
        "Ori and The Blind Forest",
        4.7,
        226,
        148,
        "The litle spirit ori is no stranger to peril, but when morning",
        [
          "assets/images/ori2.jpg",
          "assets/images/ori3.jpg",
          "assets/images/ori4.jpg",
          "assets/images/ori5.jpg",
        ],
      ),
    ];
  }
}
