import 'package:flutter_json/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Services {
  // static을 쓰는 이유 - 변하지 않는 주소의 값이나, 설정 정보 같은 데이터에 접근하는데 있어서
  // 매번 메모리에 로딩을 해서 값을 읽어 들이는 것보다. 일종의 전역변수와 같은 개념을 통해 접근하는 것이
  // 비용, 효율을 높일 수 있다.
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  // http 통신을 위한 메서드
  // getInfo메서드는 미래의 어느 시점에 User.dart파일을 통해 전달되는 데이터를 다뤄야 하므로,
  // 메서드 타입은 User 타입에 Future, List 타입이 되어야한다.
  static Future<List<User>> getInfo() async {
    try {
      // 서버와 통신이 될 때까지 기다려야 하므로 await키워드를 붙여준다.
      final response = await http.get(Uri.parse(url));
      // statusCode가 200일 경우 json data를 parsing
      if (response.statusCode == 200) {
        // User타입 List에 user라는 변수를 만들고, userFromJson의 response.body를 불러와
        // parsing을 끝낸다.
        final List<User> user = userFromJson(response.body);
        return user;
      } else {
        // Fluttertoast를 사용하여 에러 메시지를 보여준다.
        Fluttertoast.showToast(msg: "Error occurred. try again");
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error occurred. try again");
      return <User>[];
    }
  }
}
