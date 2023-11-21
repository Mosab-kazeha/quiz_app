import 'package:flutter/material.dart';
import 'package:quzz_app/clip_path/clip_path.dart';
import 'package:quzz_app/screen/question_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        leading: Icon(
          Icons.west,
          weight: 21,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage('images/Ellipse 13.png'),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 656,
                color: mainColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 17, right: 23),
                          child: Text(
                            'Today',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        Text(
                          'Month',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23),
                          child: Text(
                            'All Times',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 340,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: ((BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: ListTile(
                                    leading: Container(
                                      width: 100,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Text(
                                            index < 9
                                                ? '0${index + 1}'
                                                : "${index + 1}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF2B252C),
                                              fontSize: 15,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 18,
                                          ),
                                          CircleAvatar(
                                            radius: 28,
                                            backgroundImage: AssetImage(
                                                'images/Ellipse 24.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: Text("name"),
                                    trailing: Container(
                                      width: 60,
                                      height: 26,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFBEBFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '1${index}pt',
                                          style: TextStyle(
                                            color: Color(0xFF2B252C),
                                            fontSize: 15,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 69,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(4, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 55,
                                  child: Text(
                                    '18',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF2B252C),
                                      fontSize: 15,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("images/Ellipse 13.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 215),
                                  child: Container(
                                    width: 60,
                                    height: 26,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFBEBFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '120pt',
                                        style: TextStyle(
                                          color: Color(0xFF2B252C),
                                          fontSize: 15,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 44,
            left: 300,
            child: Container(
              width: 120,
              height: 120,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 340,
            child: Container(
              width: 90,
              height: 90,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 200,
            child: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.10000000149011612),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 75,
            top: 110,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('images/Ellipse 23.png'),
            ),
          ),
          Positioned(
            left: 60,
            top: 170,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Colors.white.withOpacity(0.300010010009011612),
                width: 100,
                height: 146,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      '442pt',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 165,
            top: 80,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('images/Ellipse 21.png'),
            ),
          ),
          Positioned(
            left: 155,
            top: 140,
            child: ClipPath(
              clipper: CustomClipPathSecond(),
              child: Container(
                color: Colors.white.withOpacity(0.300010010009011612),
                width: 90,
                height: 176,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      '${correctAnswer.toInt() + 1}pt',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 270,
            top: 137,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('images/Ellipse 22.png'),
            ),
          ),
          Positioned(
            left: 240,
            top: 170,
            child: ClipPath(
              clipper: CustomClipPathThird(),
              child: Container(
                color: Colors.white.withOpacity(0.300010010009011612),
                width: 100,
                height: 146,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 75,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      '433pt',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
