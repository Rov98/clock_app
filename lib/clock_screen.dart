import 'dart:async';
import 'dart:math';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class clock_screen extends StatefulWidget {
  @override
  _clock_screenState createState() => _clock_screenState();
}

class _clock_screenState extends State<clock_screen> {
  bool isSwitched1 = false;
  bool isSwitched2 = true;
  bool isSwitched3 = true;

  int isInt1 = 0;
  int isInt2 = 0;

  bool isSun = false;
  bool isMon = false;
  bool isTue = false;
  bool isWed = false;
  bool isThu = false;
  bool isFri = false;
  bool isSat = false;

  Widget checkBoxCustom1(String title, Widget check) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyle(
                color: Color.fromARGB(255, 112, 112, 112),
                fontFamily: 'Varela',
                fontSize: 12,
                decoration: TextDecoration.none)),
        check
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        alignment: Alignment.center,
        width: 100,
        child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Drawer(
              elevation: 0.0,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Color.fromARGB(255, 128, 216, 239),
                            Color.fromARGB(255, 50, 206, 170)
                          ],
                          end: Alignment.centerRight,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('AppBuild: 1.0.0'),
                        Text(
                          'Made with love @rov.aa',
                          style: TextStyle(fontFamily: 'Varela', fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                icon: Image.asset('assets/ic_reorder_24px.png'),
                onPressed: () => Scaffold.of(context).openDrawer())),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(children: <Widget>[
          Positioned(
              child: Image.asset('assets/Component 1 – 1.png'),
              top: -23,
              right: -10),
          Positioned(
              child: Image.asset('assets/Component 2 – 1.png'),
              bottom: -20,
              left: 0),
          Positioned(
            child: digitalClock(),
            width: size.width,
            top: 170,
          ),
          Positioned(
            child: Text("Jakarta",
                style: TextStyle(
                    color: Color.fromARGB(255, 112, 112, 112),
                    fontFamily: 'Varela',
                    fontSize: 28)),
            width: size.width,
            top: 230,
            left: 130,
          ),
          Positioned(
            child: analogClock(),
            width: size.width,
            top: 270,
          ),
          Positioned(
            child: Image.asset('assets/Path 3.png'),
            top: 160,
            right: 250,
            width: 20,
            height: 15,
          ),
          Positioned(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              /* Menu 1*/ raisedButtonGradient(
                  child: Image.asset('assets/ic_access_alarm_24px.png'),
                  onPress: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return containerSheet(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  boxCustomDesign1(
                                    waktu: '05:30',
                                    cupertino: CupertinoSwitch(
                                        value: isSwitched1,
                                        onChanged: (newVal) {
                                          setState(() {
                                            isSwitched1 = newVal;
                                          });
                                        }),
                                  ),
                                  boxCustomDesign1(
                                    waktu: '06:00',
                                    cupertino: CupertinoSwitch(
                                        value: isSwitched2,
                                        onChanged: (newVal) {
                                          setState(() {
                                            isSwitched2 = newVal;
                                          });
                                        }),
                                  ),
                                  boxCustomDesign1(
                                    waktu: '06:30',
                                    cupertino: CupertinoSwitch(
                                        value: isSwitched3,
                                        onChanged: (newVal) {
                                          setState(() {
                                            isSwitched3 = newVal;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  }),
              Container(width: 20),
              /* Menu 2*/ raisedButtonGradient(
                child: Image.asset('assets/ic_add_alarm_24px.png'),
                onPress: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return containerSheet(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topCenter,
                                height: 100,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width: 60,
                                          height: 40,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Cancel',
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontFamily: 'Varela',
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .none)))),
                                      NumberPicker.integer(
                                          initialValue: isInt1,
                                          minValue: 00,
                                          maxValue: 24,
                                          infiniteLoop: true,
                                          zeroPad: true,
                                          itemExtent: 35,
                                          listViewWidth: 50,
                                          highlightSelectedValue: true,
                                          selectedTextStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 112, 112, 112),
                                              fontFamily: 'Varela',
                                              fontSize: 18,
                                              decoration: TextDecoration.none),
                                          onChanged: (newInt) {
                                            setState(() {
                                              isInt1 = newInt;
                                            });
                                          }),
                                      Text(
                                        ' : ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 112, 112, 112),
                                            fontFamily: 'Varela',
                                            fontSize: 18,
                                            decoration: TextDecoration.none),
                                      ),
                                      NumberPicker.integer(
                                          initialValue: isInt2,
                                          minValue: 00,
                                          maxValue: 59,
                                          infiniteLoop: true,
                                          zeroPad: true,
                                          itemExtent: 35,
                                          listViewWidth: 50,
                                          highlightSelectedValue: true,
                                          selectedTextStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 112, 112, 112),
                                              fontFamily: 'Varela',
                                              fontSize: 18,
                                              decoration: TextDecoration.none),
                                          onChanged: (newInt) {
                                            setState(() {
                                              isInt2 = newInt;
                                            });
                                          }),
                                      Container(
                                          width: 60,
                                          height: 40,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Save',
                                                  style: TextStyle(
                                                      color: Colors.lightGreen,
                                                      fontFamily: 'Varela',
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .none)))),
                                    ]),
                              ),
                              boxCustomDesign2(
                                  child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Wrap(
                                  spacing: 5.0,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Sun',
                                          CircularCheckBox(
                                              value: isSun,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isSun = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Mon',
                                          CircularCheckBox(
                                              value: isMon,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isMon = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Tue',
                                          CircularCheckBox(
                                              value: isTue,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isTue = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Wed',
                                          CircularCheckBox(
                                              value: isWed,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isWed = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Thu',
                                          CircularCheckBox(
                                              value: isThu,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isThu = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Fri',
                                          CircularCheckBox(
                                              value: isFri,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isFri = newVal;
                                                });
                                              })),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 30,
                                      child: checkBoxCustom1(
                                          'Sat',
                                          CircularCheckBox(
                                              value: isSat,
                                              onChanged: (newVal) {
                                                setState(() {
                                                  isSat = newVal;
                                                });
                                              })),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ));
                        });
                      });
                },
              ),
              Container(width: 20),
              /* Menu 3*/ raisedButtonGradient(
                child: Image.asset('assets/ic_alarm_off_24px.png'),
                onPress: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return containerSheet(
                                child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                                boxCustomDesign3(waktu: '05:00', child: RawMaterialButton(child: Icon(Icons.delete, color: Color.fromARGB(100, 0, 0, 0)),onPressed: (){})),
                                boxCustomDesign3(waktu: '05:30', child: RawMaterialButton(child: Icon(Icons.delete, color: Color.fromARGB(100, 0, 0, 0)),onPressed: (){})),
                                boxCustomDesign3(waktu: '06:00', child: RawMaterialButton(child: Icon(Icons.delete, color: Color.fromARGB(100, 0, 0, 0)),onPressed: (){})),
                            ],
                          ),
                              );
                        });
                      });
                },
              )
            ]),
            bottom: 140,
            width: size.width,
          )
        ]),
      ),
    ));
  }
}

class digitalClock extends StatefulWidget {
  @override
  _digitalClockState createState() => _digitalClockState();
}

class _digitalClockState extends State<digitalClock> {
  TimeOfDay waktu = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (waktu.minute != TimeOfDay.now().minute) {
        setState(() {
          waktu = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("${waktu.hour}:${waktu.minute}",
            style: TextStyle(
                color: Color.fromARGB(255, 112, 112, 112),
                fontFamily: 'Varela',
                fontSize: 65)),
      ],
    );
  }
}

class analogClock extends StatefulWidget {
  @override
  _analogClockState createState() => _analogClockState();
}

class _analogClockState extends State<analogClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: clockPainter2(context, _dateTime),
        ),
      ),
    );
  }
}

class containerSheet extends StatelessWidget {
  final Widget child;
  const containerSheet({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 558,
      width: MediaQuery.of(context).size.width - 77,
      child: child,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: Color.fromARGB(255, 49, 206, 185)),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(16, 0, 0, 0),
                offset: Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 10),
          ]),
    );
  }
}

class boxCustomDesign1 extends StatelessWidget {
  final String waktu;
  Widget cupertino;
  bool isSwitched = false;
  boxCustomDesign1({Key key, @required this.waktu, @required this.cupertino})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 274,
          height: 40,
          child: Center(
              child: Container(
            margin: EdgeInsets.fromLTRB(3, 1, 3, 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      waktu,
                      style: TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontFamily: 'Varela',
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    )),
                Container(width: 70, height: 50, child: cupertino)
              ],
            ),
          )),
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 115, 223, 111),
                    Color.fromARGB(255, 49, 206, 185)
                  ],
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(16, 0, 0, 0),
                    offset: Offset(2, 4),
                    spreadRadius: 1,
                    blurRadius: 5)
              ]),
        )
      ],
    );
  }
}

class boxCustomDesign2 extends StatelessWidget {
  final Widget child;
  boxCustomDesign2({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 280,
          height: 60,
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(6.0),
                  margin: EdgeInsets.fromLTRB(3, 1, 3, 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.white),
                  child: child)),
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 115, 223, 111),
                    Color.fromARGB(255, 49, 206, 185)
                  ],
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(16, 0, 0, 0),
                    offset: Offset(2, 4),
                    spreadRadius: 1,
                    blurRadius: 5)
              ]),
        )
      ],
    );
  }
}

class boxCustomDesign3 extends StatelessWidget {
  final String waktu;
  final bool isSwitched = true;
  Widget child;
  boxCustomDesign3({Key key, @required this.waktu, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 274,
          height: 40,
          child: Center(
              child: Container(
            margin: EdgeInsets.fromLTRB(3, 1, 3, 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19), color: Colors.white),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(waktu,
                        style: TextStyle(
                            color: Color.fromARGB(255, 112, 112, 112),
                            fontFamily: 'Varela',
                            fontSize: 18,
                            decoration: TextDecoration.none))),
                Container(child: child, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)))
              ],
            ),
          )),
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 115, 223, 111),
                    Color.fromARGB(255, 49, 206, 185)
                  ],
                  end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(16, 0, 0, 0),
                    offset: Offset(2, 4),
                    spreadRadius: 1,
                    blurRadius: 5)
              ]),
        )
      ],
    );
  }
}

class raisedButtonGradient extends StatelessWidget {
  final Widget child;
  final Function onPress;
  const raisedButtonGradient({Key key, @required this.child, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: <Color>[
                  Color.fromARGB(255, 49, 206, 169),
                  Color.fromARGB(255, 128, 216, 239)
                ],
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: child,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      height: 62,
      minWidth: 64,
    );
  }
}

class clockPainter2 extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  clockPainter2(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // aksesoris var
    var rect1 = Offset(85, 88) & Size(10, 25);
    var rect2 = Offset(170, 185) & Size(25, 10);
    var rect3 = Offset(170, 5) & Size(25, 10);
    var rect4 = Offset(265, 88) & Size(10, 25);

    var dotMid = Paint()..color = Color.fromARGB(255, 164, 167, 212);
    var secPaint = Paint()
      ..color = Color.fromARGB(255, 229, 69, 69)
      ..strokeWidth = 3;
    var minPaint = Paint()
      ..color = Color.fromARGB(255, 178, 168, 168)
      ..strokeWidth = 3;
    var hourPaint = Paint()
      ..color = Color.fromARGB(255, 33, 32, 32)
      ..strokeWidth = 3;

    // canvas jam
    var paint = Paint()..color = Color.fromARGB(255, 49, 206, 169);
    var outline = Paint()..color = Colors.white;

    canvas.drawCircle(center, min(centerX, centerY), paint);
    canvas.drawCircle(center, min(centerX, centerY) - 10, outline);

    // canvas aksesoris
    var aksesoris = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectXY(rect1, 85, 90), aksesoris);
    canvas.drawRRect(RRect.fromRectXY(rect2, 85, 90), aksesoris);
    canvas.drawRRect(RRect.fromRectXY(rect3, 85, 90), aksesoris);
    canvas.drawRRect(RRect.fromRectXY(rect4, 85, 90), aksesoris);

    // min math
    double minX =
        centerX + size.width * 0.2 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.2 * sin((dateTime.minute * 6) * pi / 180);
    // canvas min
    canvas.drawLine(center, Offset(minX, minY), minPaint);

    // hour math
    double hourX = centerX +
        size.width *
            0.15 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.15 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // canvas hour
    canvas.drawLine(center, Offset(hourX, hourY), hourPaint);

    // second math
    double secondX =
        centerX + size.width * 0.23 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.23 * sin((dateTime.second * 6) * pi / 180);
    // canvas second
    canvas.drawLine(center, Offset(secondX, secondY), secPaint);

    // center dot
    canvas.drawCircle(center, 12, dotMid);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
