import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/added_image.dart';
import './widgets/new_transaction.dart';
import './model/transaction.dart';

import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[200],
        primarySwatch: Colors.grey,
        accentColor: Color.fromRGBO(150, 150, 210, 5),
        cursorColor: Color.fromRGBO(150, 150, 210, 5),
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontFamily: 'Gelasio',
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
              headline5: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              headline6: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.grey,
              ),
              button: TextStyle(
                fontFamily: 'Gelasio',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(150, 150, 210, 5),
              ),
              overline: TextStyle(
                fontFamily: 'Gelasio',
                fontSize: 15,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontFamily: 'Gelasio',
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(150, 150, 210, 5),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(150, 150, 210, 5),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  bool _addExpenses = false;

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
    print(_userTransactions);
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final pageBody = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Expenses',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  value: _addExpenses,
                  onChanged: (val) {
                    setState(
                      () {
                        _addExpenses = val;
                      },
                    );
                  },
                ),
              ],
            ),
          SafeArea(
            child: Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.32,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddedImage(),
                  NewTransaction(_addNewTransaction),
                ],
              ),
            ),
          ),
          Container(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.5,
              child: TransactionList(_userTransactions, _deleteTransaction)),
          Container(
              height: (mediaQuery.size.height - mediaQuery.padding.top) * 0.2,
              child: Chart(_recentTransaction)),
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(child: pageBody)
        : Scaffold(
            body: pageBody,
          );
  }
}
