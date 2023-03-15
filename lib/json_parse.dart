import 'package:flutter/material.dart';
import 'package:flutter_json/service.dart';
import 'package:flutter_json/user.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool loading = false;

  // jsonparse 위젯이 생성될때마다 getInfo메서드 생성
  @override
  void initState() {
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // loading 변수의 값이 true일 땐 'User'를 출력, false일땐 'loading...' 출력
        title: Text(loading ? 'User' : 'loading...'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // User타입의 user라는 변수를 생성해준 다음 _user[index]를 넘겨준다.
          User user = _user[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(user.name),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(user.phone),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Close')),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.phone_android_outlined,
                    color: Colors.blue)),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
        itemCount: _user.length,
      ),
    );
  }
}
