part of 'widgets.dart';

class QuestionBox extends StatelessWidget {
  final String question;
  const QuestionBox({@required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          question,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
