**My Expenses Mobile Application**

This mobile application seeking expenses. 
First of all the title needs to be provided, where money was spent. 
Secondly, the amount of money needs to be provided, how much money was spent.
After all the date needs to be provided when money was spent. All grouped information is added as a transaction item in the transaction list. Below the chart shows the percentage of how much money was sent per each day. The total amount of money spent per day is divided by the total amount of money spent per week.

The application is created of **a widget tree**, the **transaction item**, the **list of transactions**, and **methods**:

- **A widget tree:**



![](https://github.com/Laura555-p/myexpenses/blob/master/assets/images/my_expenseswidgettree.png)


- **Transaction item** is created under a blueprint of transactionclass, it describes what information about the transaction is required. In this case (id, title, amount, date).

- List **'transactions'** holding list of transactions and transaction class used as a type of list.

- Method **'_addNewTransaction'** adding transaction.

- Method **'_deleteTransaction'** deleting transaction.

- Method (get) **'recentTransactions'** dynamically calculated property which returns transactions younger than seven days.

- Method (get) **'groupedTransactionValues'** dynamically calculated property which returns transaction values grouped by weekdays (how much money was spent in a  particular weekday).

- Method (get) **'totalSpending'** dynamically calculated property which returns total spending per week.  














![](https://github.com/CodingFlutter/my_expenses/blob/main/assets/images/myexpenses1.jpeg)
![](https://github.com/CodingFlutter/my_expenses/blob/main/assets/images/myexpenses2.jpeg)
![](https://github.com/CodingFlutter/my_expenses/blob/main/assets/images/myexpenses3.jpeg)
![](https://github.com/CodingFlutter/my_expenses/blob/main/assets/images/myexpenses4.jpeg)


