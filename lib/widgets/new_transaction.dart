import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'adaptive_flat_button1.dart';
import 'adaptive_flat_button2.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      //stops the function execution
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    setState(() {
      _titleController.clear();
      _amountController.clear();

      //unfocus TextField
      WidgetsBinding.instance.focusManager.primaryFocus.unfocus();
    });
  }

  void _presentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final addExpensesWidget = Card(
      elevation: 1,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: TextField(
                style: Theme.of(context).textTheme.headline5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  icon: Icon(
                    Icons.title,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(150, 150, 210, 5),
                      width: 2,
                    ),
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextField(
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  icon: Icon(
                    Icons.attach_money,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(150, 150, 210, 5),
                      width: 2,
                    ),
                  ),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.038,
              margin: EdgeInsets.all(5),
              child: Center(
                child: Text(
                  _selectedDate == null
                      ? 'The date not chosen!'
                      : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: AdaptiveFlatButton1(
                          'Choose Date', _presentDataPicker)),
                  Expanded(
                      child: AdaptiveFlatButton2('Add Expenses', _submitData)),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandscape) addExpensesWidget,
          if (isLandscape)
            Card(
              elevation: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: TextField(
                        style: Theme.of(context).textTheme.headline5,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          icon: Icon(
                            Icons.title,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 210, 5),
                              width: 2,
                            ),
                          ),
                        ),
                        controller: _titleController,
                        onSubmitted: (_) => _submitData(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: TextField(
                        style: Theme.of(context).textTheme.headline5,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          icon: Icon(
                            Icons.attach_money,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 210, 5),
                              width: 2,
                            ),
                          ),
                        ),
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        onSubmitted: (_) => _submitData(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          _selectedDate == null
                              ? 'The date not chosen!'
                              : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                              child: AdaptiveFlatButton1(
                                  'Choose Date', _presentDataPicker)),
                          Expanded(
                              child: AdaptiveFlatButton2(
                                  'Add Expenses', _submitData)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
