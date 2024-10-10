abstract class ApiUrls {
  static String contactBaseUrl = "https://randomuser.me/api";

  static String listeContactsUrl(int size, int page) =>
      "$contactBaseUrl/?results=$size&page=$page";
}
