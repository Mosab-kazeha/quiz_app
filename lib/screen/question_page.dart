import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quzz_app/model/question_model.dart';
import 'package:quzz_app/component/flushbar.dart';
import 'package:quzz_app/screen/result_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

List<QuestionModel> question = [
  QuestionModel(question: 'How tall are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
  QuestionModel(question: 'How are you ?', time: 20, answers: [
    AnswerModel(answer: 'fine', isCorrect: false),
    AnswerModel(answer: 'good', isCorrect: true),
    AnswerModel(answer: 'bad', isCorrect: false),
    AnswerModel(answer: 'I have a bad time', isCorrect: false),
  ]),
  QuestionModel(question: 'Did we pass the exam ?', time: 20, answers: [
    AnswerModel(answer: 'no', isCorrect: false),
    AnswerModel(answer: 'absolutely', isCorrect: true),
    AnswerModel(answer: 'sure', isCorrect: true),
    AnswerModel(answer: 'definitely', isCorrect: true),
  ]),
  QuestionModel(question: 'How old am i ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '30', isCorrect: false),
    AnswerModel(answer: '70', isCorrect: false),
    AnswerModel(answer: '24', isCorrect: true),
  ]),
];

/*List<QuestionModel> newQuestion = [];*/

PageController controller = PageController();
TextEditingController questionController = TextEditingController();
TextEditingController firstAnswerController = TextEditingController();
TextEditingController secondAnswerController = TextEditingController();
TextEditingController thirdAnswerController = TextEditingController();
TextEditingController forthAnswerController = TextEditingController();

double correctAnswer = 0;
double wrongAnswer = 0;
num answerTime = 0;
bool? userAnswer;
int weDone = 0;
Color mainColor = Color(0xFFA32EC1);

class _QuestionPageState extends State<QuestionPage> with UtilityComponent {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        answerTime++;
      });
    });
  }

  Widget build(BuildContext context) {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: question.length,
        itemBuilder: (BuildContext context, index) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 70),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(child: Image.asset("images/icon1.png")),
                            SizedBox(width: 300),
                            InkWell(child: Image.asset("images/icon2.png")),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Expanded(
                      child: ListView.builder(
                          itemCount: question[index].answers.length,
                          itemBuilder: (BuildContext context, ind) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 48,
                                vertical: 11,
                              ),
                              child: InkWell(
                                onTap: () {
                                  weDone++;

                                  if (question[index].answers[ind].isCorrect ==
                                      true) addNewQuestion(context);

                                  weDone + 1 > question.length
                                      ? {
                                          /*question.addAll(newQuestion),*/
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MyHomePage(),
                                            ),
                                          ),
                                        }
                                      : checkoutAnswer(
                                          question[ind].answers[ind].isCorrect,
                                          context,
                                          question[ind].time,
                                          answerTime);
                                  answerTime = 0;

                                  /*userAnswer =
                                      question[index].answers[ind].isCorrect;*/
                                },
                                child: Container(
                                  width: 240,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 2.5,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: mainColor,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 21),
                                        child: Text(
                                          question[index].answers[ind].answer,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF2B252C),
                                            fontSize: 20,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: /*userAnswer == null
                                            ? */
                                              Image.asset('images/null.png')
                                          /*: userAnswer == true
                                                ? Image.asset("images/true.png")
                                                : Image.asset(
                                                    "images/false.png"),*/
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                Positioned(
                  top: 132,
                  left: 330,
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
                  top: 40,
                  left: 247,
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
                  bottom: 700,
                  left: 100,
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
                  top: 120,
                  right: 345,
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
                  top: 190,
                  left: 28,
                  child: Container(
                    width: 340,
                    height: 180,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFFFBEBFF),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      wrongAnswer <= 9
                                          ? '0${correctAnswer.toInt()}'
                                          : '${correctAnswer.toInt()}',
                                      style: TextStyle(
                                        color: Color(0xFF1E8334),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    width: 15 * correctAnswer,
                                    height: 8,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF1E8334),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    width: 15 * wrongAnswer,
                                    height: 8,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFD05904),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    duration: Duration(seconds: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      wrongAnswer <= 9
                                          ? '0${wrongAnswer.toInt()}'
                                          : '${wrongAnswer.toInt()}',
                                      style: TextStyle(
                                        color: Color(0xFFD05904),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Question ${index + 1} / ${question.length}',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          question[index].question,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF2B252C),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 165,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        color: mainColor,
                        value: 0.1 * answerTime.toDouble() / 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 172,
                  left: 187,
                  child: Text(
                    answerTime <= 9
                        ? "0${answerTime.toString()}"
                        : answerTime.toString(),
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
