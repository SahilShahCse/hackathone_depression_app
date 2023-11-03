import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String userName = '';
  List detailsRequired = ['Name', 'Age', 'Gender', 'Occupation', 'City/Town Name', 'Any medical issue? yes/no'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height : 10),
              Text('We need this data to proceed further ...' , textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF00A86B), fontSize: 22),),
              SizedBox(height : 20),
              Expanded(
                child: ListView.builder(
                  itemCount: detailsRequired.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCard(title: detailsRequired[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
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

  Widget buildCard({required String title}) {
    return Card(
      elevation: 1.0,
      borderOnForeground: true,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text('${title} : ' , style:  TextStyle(color: Colors.grey),),
            Expanded(child: buildCardContent()),
          ],
        ),
      ),
    );
  }

  Widget buildCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildNameInputField(),
      ],
    );
  }

  Widget buildNameInputField() {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none, // Remove the outline border
      ),
      onChanged: (value) {
        setState(() {
          userName = value;
        });
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle the user's name (userName) as needed
      },
      child: Text('Submit'),
    );
  }
}
