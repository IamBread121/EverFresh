import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<Map<String, dynamic>> shoppingList = [
    {'name': 'Apple', 'qty': 4},
    {'name': 'Pear', 'qty': 5},
    {'name': 'Kiwi', 'qty': 3}
  ];

  void _deleteItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  int itemCount = 1;

  void _showAddItemDialog() {
    String itemName = '';
    String itemQty = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField for Item Name
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  itemName = value;
                },
              ),
              const SizedBox(height: 10),
              // TextField for Item Quantity
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  itemQty = value;
                },
              ),
            ],
          ),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            // Add Button
            TextButton(
              onPressed: () {
                // Validate and add item
                if (itemName.isNotEmpty && itemQty.isNotEmpty) {
                  setState(() {
                    shoppingList.add({
                      'name': itemName,
                      'qty': int.tryParse(itemQty) ?? 1,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//==========================================================================================================================
// Shopping List Title
              const Text(
                "Shopping List",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
//==========================================================================================================================
// List Buider
              Expanded(
                child: ListView.builder(
                    itemCount: shoppingList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDAE9DC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 30),
                                child: Text(
                                  shoppingList[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                shoppingList[index]['qty'].toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        _deleteItem(index);
                                      }),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
