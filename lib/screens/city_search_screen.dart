import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CitySearchScreenState();
}
class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _cityTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter a city'),),
      body: Form(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                        controller: _cityTextController,
                        decoration: InputDecoration(
                            labelText: 'Enter a city',
                            hintText: 'Example: Chicago'
                        )
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pop(context, _cityTextController.text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 55,
        width: 175,
        //padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: ElevatedButton(
          onPressed: () {

          },
          child: const Text('Submit'),
        ),
      ),
    );
  }
}