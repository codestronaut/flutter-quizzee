part of 'widgets.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
  final Function onTap;
  const AnswerButton({
    @required this.answer,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        answer ? 'True' : 'False',
        style: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          64.0,
        ),
        backgroundColor: answer ? Colors.greenAccent : Colors.redAccent,
        primary: answer ? Colors.green[600] : Colors.white,
      ),
    );
  }
}
