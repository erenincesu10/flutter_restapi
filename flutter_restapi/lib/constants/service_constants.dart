const String _baseUrl = "https://reqres.in/api/";

Uri getUrl(String endpoint) => Uri.parse(_baseUrl + endpoint);
