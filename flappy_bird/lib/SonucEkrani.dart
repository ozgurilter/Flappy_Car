import 'package:flappy_bird/screen.dart';
import 'package:flutter/material.dart';
import 'game_store.dart';

class SonucEkrani extends StatelessWidget {
  final List<Map<String, dynamic>> userList;
  final GameStore gameStore;

  SonucEkrani({required this.userList , required this.gameStore});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedUserList = List.from(userList);
    sortedUserList.sort((a, b) {
      int scoreComparison = b['score'].compareTo(a['score']);
      if (scoreComparison != 0) {
        return scoreComparison;
      }
      return a['username'].compareTo(b['username']);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Result Page'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow[100]!,
                Colors.yellow[200]!,
                Colors.yellow[300]!,
                Colors.yellow[400]!,

              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DataTable(
                columns: const [
                  DataColumn(label: Text('Username' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Score',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                ],
                rows: sortedUserList.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user['username'] ?? '')),
                      DataCell(Text(user['password'] ?? '')),
                      DataCell(Text(user['score'].toString())),
                    ],
                  );
                }).toList(),
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst); // Giriş ekranına dön
                    },
                    child: Text('New Player', style: TextStyle(color: Colors.black, fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      // AlertDialog'ı göster
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Warning'),
                            content: Text(
                              'If you get a worse score, your old score will not be accepted.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Screen(
                                        userList: userList,
                                        userIndex: userList.length -1,
                                        gameStore: gameStore,
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Onayla'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // AlertDialog'ı kapat
                                },
                                child: Text('Kapat'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Try Your Chance Again', style: TextStyle(color: Colors.black, fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
