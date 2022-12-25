class Kost {
  String name;
  String addres;
  String imageUrl;

  Kost(
    this.name,
    this.addres,
    this.imageUrl,
  );
  static List<Kost> generateRecommended() {
    return [
      Kost(
        "Harapan Bunda 2",
        "Jln. Kalimati",
        "assets/images/house01.jpeg",
      ),
      Kost(
        "Harapan Bunda 2",
        "Jln. Kalimati",
        "assets/images/house02.jpeg",
      ),
    ];
  }

  static List<Kost> generateBestOffer() {
    return [
      Kost(
        "Kost Ripai No.12",
        "Jln. Plausan Timur 45",
        "assets/images/offer01.jpeg",
      ),
      Kost(
        "Kost Kuning N0.34",
        "Jln. Plausan Timur 45",
        "assets/images/offer02.jpeg",
      ),
    ];
  }
}
