import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String details;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.details,
    this.isRead = false,
  });
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Message',
      details: 'You have a new message from John.',
    ),
    NotificationItem(
      title: 'Reminder',
      details: 'Don\'t forget the meeting at 3:00 PM.',
    ),
    // Add more notification items here
  ];

  void _markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  void _clearNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Text('Notifications'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(notifications[index].title),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      _clearNotification(index);
                    }
                  },
                  background: Container(
                    color: Color.fromRGBO(107, 59, 225, 1),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .95,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(107, 59, 225, 1),
                        ),
                        color: notifications[index].isRead
                            ? Colors.grey.shade300
                            : Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifications[index].title,
                            style:const  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            notifications[index].details,
                            style:const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          if (!notifications[index].isRead)
                            TextButton(
                              onPressed: () => _markAsRead(index),
                              child:const Text(
                                'Mark as Read ',
                                style: TextStyle(
                                    color: Color.fromRGBO(107, 59, 225, 1)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: const  ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(107, 59, 225, 1))),
                  onPressed: () {
                    setState(() {
                      notifications.clear();
                    });
                  },
                  child:const  Text('Clear All'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
