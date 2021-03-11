abstract class Environment {
  static headers(token) {
    return {
      "Accept": "*/*",
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
  }

  static const URL = "http://192.168.1.6:5000/api/";
  
}