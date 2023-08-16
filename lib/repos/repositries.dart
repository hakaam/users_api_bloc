import 'dart:convert';
import 'package:users_api_bloc/model/user_model.dart';
import 'package:http/http.dart';
class UserRepositry {
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>>getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    print("API Response Body: ${response.body}");
    print("API Response Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
