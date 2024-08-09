
import 'package:flappy_bird/game_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'login_store.dart';
import 'screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final loginStore = LoginStore();
  final GameStore gameStore = GameStore();


  @override
  Widget build(BuildContext context) {
    var ekransize = MediaQuery.of(context);
    final double genislik = ekransize.size.width;
    final double yukseklik = ekransize.size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: yukseklik / 10),
            child: Text(
              "Flapping Cars",
              style: TextStyle(
                color: Colors.white,
                fontSize: genislik / 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: yukseklik / 10),
            child: SizedBox(
              width: genislik / 2,
              height: yukseklik / 6,
              child: Image.asset("image/car.jpeg"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(yukseklik / 30),
            child: Observer(
              builder: (_) => TextField(
                controller: loginStore.tfKullanici,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adınızı Giriniz.",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(yukseklik / 30),
            child: Observer(
              builder: (_) => TextField(
                obscureText: true,
                controller: loginStore.tfPassword,
                decoration: InputDecoration(
                  hintText: "Password Giriniz.",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              "Giriş",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              if (loginStore.tfKullanici.text.isEmpty || loginStore.tfPassword.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Lütfen kullanıcı adınızı ve şifrenizi giriniz.',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                );
              } else {
                bool userExists = loginStore.userExists(
                    loginStore.tfKullanici.text, loginStore.tfPassword.text);
                int userIndex = loginStore.getUserIndex(
                    loginStore.tfKullanici.text, loginStore.tfPassword.text);

                if (userExists) {
                  var userScore = loginStore.userList[userIndex]['score'];
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'This user already has an existing record. Her/His old score is $userScore',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(
                        userList: loginStore.userList,
                        userIndex: userIndex,                                     bv
                  ).then((_) {
                    loginStore.clearFields();
                  });
                } else {
                  loginStore.addUser(
                      loginStore.tfKullanici.text, loginStore.tfPassword.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(
                        userList: loginStore.userList,
                        userIndex: loginStore.userList.length - 1,
                        gameStore: gameStore,
                        ),
                    ),
                  ).then((_) {
                    loginStore.clearFields();
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }
}



