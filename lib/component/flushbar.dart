import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:quzz_app/model/question_model.dart';
import 'package:quzz_app/screen/question_page.dart';

mixin UtilityComponent {
  showMyFlushBar(BuildContext context) {
    Flushbar(
      title: "Hey Ninja",
      titleColor: Colors.white,
      message:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
      mainButton: ElevatedButton(
        onPressed: () {},
        child: Text(
          "CLAP",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Hello Hero",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.yellow[600],
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        "You killed that giant monster in the city. Congratulations!",
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.green,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    )..show(context);
  }

  checkoutAnswer(
      bool isCorrect, BuildContext context, num time, num answerTime) {
    if (time < answerTime) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Time Out'),
        backgroundColor: Colors.blue,
      ));
      controller.nextPage(
          duration: Duration(milliseconds: 700), curve: Curves.easeIn);
    } else {
      if (isCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Success'),
          backgroundColor: Colors.green,
        ));
        controller.nextPage(
            duration: Duration(milliseconds: 700), curve: Curves.easeIn);
        correctAnswer++;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Failed'),
          backgroundColor: Colors.red,
        ));

        controller.nextPage(
            duration: Duration(milliseconds: 700), curve: Curves.easeIn);
        wrongAnswer++;
      }
    }
  }

  addNewQuestion(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: myTextField("The Question is", questionController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      myTextField("The First Answer is", firstAnswerController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: myTextField(
                      "The Second Answer is", secondAnswerController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      myTextField("The Third Answer is", thirdAnswerController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      myTextField('The Forth Answer is', forthAnswerController),
                ),
                InkWell(
                  onTap: () {
                    question.add(QuestionModel(
                        question: questionController.text,
                        time: 20,
                        answers: [
                          AnswerModel(
                              answer: firstAnswerController.text,
                              isCorrect: false),
                          AnswerModel(
                              answer: secondAnswerController.text,
                              isCorrect: true),
                          AnswerModel(
                              answer: thirdAnswerController.text,
                              isCorrect: true),
                          AnswerModel(
                              answer: forthAnswerController.text,
                              isCorrect: true),
                        ]));
                    answerTime = 0;
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 240,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.5,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: mainColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text('Save Your Question'),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  myTextField(String labelText, TextEditingController controller) {
    return Container(
      width: 320,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA32EC1),
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA32EC1),
            ),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
/*
bool firstAnswerIsCorrect = false;
bool secondAnswerIsCorrect = false;
bool thirdAnswerIsCorrect = false;
bool forthAnswerIsCorrect = false;
checkBox(bool? isCorrectValue) {
  return Checkbox(
      value: isCorrectValue,
      onChanged: (change) {
        change = isCorrectValue!;
      });
}
*/
