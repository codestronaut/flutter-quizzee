part of 'pages.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        // Show alert
        Alert(
          context: context,
          title: 'Congrats!',
          desc: 'You have reached the last question',
          image: Image.asset(
            'assets/medal.png',
            height: 64.0,
            width: 64.0,
          ),
          buttons: [
            DialogButton(
              child: Text(
                'Okay',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // Close the alert
                Navigator.pop(context);
              },
            )
          ],
        ).show();

        // Reset question
        quizBrain.reset();
        // Clear score kepper
        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(markIcon(true));
        } else {
          scoreKeeper.add(markIcon(false));
        }

        quizBrain.nextQuestion();
      }
    });
  }

  Widget markIcon(bool isCorrect) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Icon(
        Icons.circle,
        size: 12.0,
        color: isCorrect ? Colors.greenAccent : Colors.red[600],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'F5F5F7'.toColor(),
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Quizzee',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                children: scoreKeeper,
              ),
            ),
            QuestionBox(
              question: quizBrain.getQuestionText(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32.0),
              child: Column(
                children: [
                  AnswerButton(
                    onTap: () {
                      checkAnswer(true);
                    },
                    answer: true,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  AnswerButton(
                    onTap: () {
                      checkAnswer(false);
                    },
                    answer: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
