import 'package:http/http.dart' as http;

const baseURL = "https://pirox-foodapi.000webhostapp.com";

class Connection{

  Future getConnection() async{
    try{
      http.Response response = await http.get(baseURL);
      if (response.statusCode == 200){
        print('----------------------------------------');
        print(response.body);
      } else {
        print('----------------------------------------');
        print(response.statusCode);
      }
    } catch (e) {
      print('-------------------------------');
      print(e);
    }
  }
}