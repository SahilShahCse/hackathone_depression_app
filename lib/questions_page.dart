import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuestionsPage(),
  ));
}

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<String> questions = [
    'શું તમને તમારા જીવનથી મૂળભૂત રીતે સંતોષ છે?',
    'શું તમે તમારી ઘણી પ્રવૃત્તિઓ અને શોખ પડતા મુક્યા છે?',
    'શું તમને લાગે છે કે તમારા જીવનમાં ખાલીપો છે?',
    'શું તમે અવારનવાર કંટાળી જાવ છો?',
    'શું તમે મોટા ભાગના સમયે સારા મિજાજમાં હોવ છો?',
    'શું તમને ડર રહે છે કે તમારી સાથે કશુંક ખરાબ થવાનું છે?',
    'શું તમે મોટા ભાગના સમયે ખુશ રહો છો?',
    'શું તમને અસહાય હોવાનું ઘણી વાર લાગે છે?',
    'શું તમે બહાર જઈને નવું કશુંક કરવાને બદલે ઘરે રહેવાનું પસંદ કરો છો?',
    'શું તમને લાગે છે કે મોટા ભાગે તમને યાદશક્તિની બહુ સમસ્યાઓ રહે છે?',
    'શું તમે વિચારો છો કે હાલમાં જીવતા રહેવું અદભુત છે?',
    'તમે હાલમાં જેવા છો તેનાથી શું તમને બિલકુલ નકામા હોવાનું લાગે છે?',
    'શું તમે ઊર્જાથી ભરપૂર હોવાનું અનુભવો છો?',
    'શું તમને લાગે છે કે તમારી પરિસ્થિતિ આશારહિત છે?',
    'શું તમે વિચારો છો કે તમારા કરતા મોટા ભાગના લોકો વધારે સારી સ્થિતિમાં છે?',
  ];

  List<List<String>> answers = [
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
    ["હા", "ના"],
  ];

  List<int> selectedAnswers = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]; // -1 represents no selection
  int current_index = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    print(selectedAnswers);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: (current_index < 15)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),

                    Text(
                      'Welcome,',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Answer Carefully...',
                      style: TextStyle(color: Color(0xFF00A86B), fontSize: 20),
                    ),
                    SizedBox(height: 50),
                    buildQuestion(current_index),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if(current_index==14){
                              for (int i = 0; i < selectedAnswers.length; i++) {
                                if (selectedAnswers[i] == 0) {
                                  score++;
                                }
                              }
                            }
                            current_index += 1;
                            setState(() {});
                          },
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00A86B),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildProgressionCircle(),
                    SizedBox(height: 30),
                    buildScore(),
                    SizedBox(height: 30),
                    (score>6)? Text('Your Score is bad , u need to consult a doctor\n Helpline Number : 18005990019' , textAlign: TextAlign.center,):Text('Your Score is Good , no need to consult a doctor'),
                    SizedBox(height: 30),
                    Text(
                      'Your data will be sent to government , and you will be soon assigned a doctor if needed.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/detailsPage');

                            setState(() {});
                          },
                          child: Text('Proceed'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00A86B),
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

  Widget buildScore() {

    return Text(
      'Your Score is : ${score}',
      style: TextStyle(fontSize: 22 , color: (score < 6) ? Color(0xFF00A86B) : Colors.redAccent,),
    );
  }

  Widget buildProgressionCircle() {

    return Container(
      width: 100, // Set the width to your desired size
      height: 100, // Set the height to your desired size
      child: CircularProgressIndicator(
        value: score / 15,
        strokeWidth: 10,
        backgroundColor: Colors.grey[300],
        color: (score < 6) ? Color(0xFF00A86B) : Colors.redAccent,
      ),
    );
  }

  Widget buildQuestion(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${index + 1}. ${questions[index]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 20),
        buildAnswerOptions(index),
      ],
    );
  }

  Widget buildAnswerOptions(int questionIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: answers[questionIndex].asMap().entries.map((entry) {
        final int answerIndex = entry.key;
        final String answerText = entry.value;
        final bool isSelected = selectedAnswers[questionIndex] == answerIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedAnswers[questionIndex] = answerIndex;
            });
          },
          child: Card(
            color: isSelected ? Color(0xFF00A86B) : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                answerText,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.black,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
