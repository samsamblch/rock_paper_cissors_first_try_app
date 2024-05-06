import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

String resultGame = 'Камень, Ножницы, Бумага!\n                    1!2!3!!!';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int computerChoice = 4;
  int userChoice = 4;
  int winerFinal = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 153, 148, 156),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultGame,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 230, 23, 8),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //TODO: картинка результата
            Container(
              height: 200,
              width: 300,

              //color: Colors.amber,
              child: Image.asset('lib/assets/images/winer/win_$winerFinal.png'),
            ),
            SizedBox(
              height: 20,
            ),
            // Результаты
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Ваш выбор: ',
                  style: TextStyle(
                      color: Colors.grey[900], fontWeight: FontWeight.bold),
                ),
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                        'lib/assets/images/choice/choice_$userChoice.png')),
                Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                        'lib/assets/images/choice/choice_$computerChoice.png')),
                Text(
                  ': Компьютер',
                  style: TextStyle(
                      color: Colors.grey[900], fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 10,
            ),
            Image.asset('lib/assets/images/123.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // КАМЕНЬ
                TextButton(
                  onPressed: () {
                    setState(() {
                      computerChoice = Random().nextInt(3) + 1;
                      if (computerChoice == 1) {
                        // компьютер - ножницы
                        winerFinal = 2; // победил - камень
                        resultGame = 'ПОБЕДА! КАМЕНЬ БЬЕТ НОЖНИЦЫ!';
                      }
                      if (computerChoice == 2) {
                        //комп камень
                        winerFinal = 4; // ничья
                        resultGame = 'НИЧЬЯ! ДАВАЙ ЕЩЕ! 1! 2! 3!';
                      }
                      if (computerChoice == 3) {
                        // ком бумага
                        winerFinal = 3; // камень проиграл
                        resultGame = 'ПОРАЖЕНИЕ! БУМАГА БЬЕТ КАМЕНЬ!';
                      }
                      userChoice = 2;
                    });
                  },
                  ////////
                  child: Text('Камень'),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 66, 63, 63)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 63, 63)),
                      ),
                    ),
                  ),
                ),

                // НОЖНИЦЫ
                TextButton(
                    onPressed: () {
                      setState(() {
                        computerChoice = Random().nextInt(3) + 1;
                        if (computerChoice == 1) {
                          // компьютер - ножницы
                          winerFinal = 4; // ничья
                          resultGame = 'НИЧЬЯ! ДАВАЙ ЕЩЕ! 1! 2! 3!';
                        }
                        if (computerChoice == 2) {
                          //комп камень
                          winerFinal = 2; // комп победа
                          resultGame = 'ПОРАЖЕНИЕ! КАМЕНЬ ТУПИТ НОЖНИЦЫ';
                        }
                        if (computerChoice == 3) {
                          // ком бумага
                          winerFinal = 1; // ножницы выйграли
                          resultGame = 'ПОБЕДА! НОЖНИЦЫ РЕЖУТ БУМАГУ!';
                        }
                        userChoice = 1;
                      });
                    },
                    child: Text('Ножницы'),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 66, 63, 63)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 63, 63)),
                        )))),

                // БУМАГА
                TextButton(
                    onPressed: () {
                      setState(() {
                        computerChoice = Random().nextInt(3) + 1;
                        if (computerChoice == 1) {
                          // компьютер - ножницы
                          winerFinal = 1; // проигрыш
                          resultGame = 'ПОРАЖЕНИЕ! НОЖНИЦЫ РЕЖУТ БУМАГУ!';
                        }
                        if (computerChoice == 2) {
                          //комп камень
                          winerFinal = 3; //  победа
                          resultGame = 'ПОБЕДА! БУМАГА БЬЕТ КАМЕНЬ!';
                        }
                        if (computerChoice == 3) {
                          // ком бумага
                          winerFinal = 4; // ничья
                          resultGame = 'НИЧЬЯ! ДАВАЙ ЕЩЕ! 1! 2! 3!';
                        }
                        userChoice = 3;
                      });
                    },
                    child: Text('Бумага'),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 84, 80, 80)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 63, 63)),
                        )))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
