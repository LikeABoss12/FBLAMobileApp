// amar look at this
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, duplicate_ignore, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'homepage.dart';

void main() {
  runApp(CalendarApp());
}

// ignore: use_key_in_widget_constructors
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHS Official',
      home: CalendarScreen(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CalendarScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  List<Event> events = [];

  void selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }

  void deleteEvent(Event event) {
    setState(() {
      events.remove(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(child: Text('School Calendar'),),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),


      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: CalendarView(
                selectedDate: selectedDate,
                onDateSelected: selectDate,
              ),
            ),
          ),
          Positioned(
            top: 430,
            left: 0,
            right: 0,
            bottom: 0,
            child: Material(
              elevation: 5, // Adjust the shadow size as desired
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: EventList(
                  selectedDate: selectedDate,
                  events: events,
                  onDeleteEvent: deleteEvent,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateEventScreen(
                onAddEvent: addEvent,
              ),
            ),
          );
        },
        backgroundColor: Colors.orange[400],
        child: Icon(Icons.add),
      ),
    );
  }
}

class CalendarView extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  CalendarView({required this.selectedDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      daysOfWeekHeight: 80,
      focusedDay: selectedDate,
      firstDay: DateTime.now().subtract(Duration(days: 365)),
      lastDay: DateTime.now().add(Duration(days: 365)),
      calendarFormat: CalendarFormat.month,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          shape: BoxShape.circle,
        ),
      ),
      onDaySelected: (date, _) => onDateSelected(date),
    );
  }
}

class EventList extends StatelessWidget {
  final DateTime selectedDate;
  final List<Event> events;
  final Function(Event) onDeleteEvent;

  EventList({
    required this.selectedDate,
    required this.events,
    required this.onDeleteEvent,
  });

  List<Event> getEventsForSelectedDate() {
    return events.where((event) {
      return event.date.year == selectedDate.year &&
          event.date.month == selectedDate.month &&
          event.date.day == selectedDate.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Event> selectedEvents = getEventsForSelectedDate();

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Events',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedEvents.length,
              itemBuilder: (context, index) {
                Event event = selectedEvents[index];
                return Container(
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.calendar_month_rounded, size: 40,),
                    title: Text(
                      event.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start: ${_formatTime(event.startTime)}',
                        ),
                        Text(
                          'End: ${_formatTime(event.endTime)}',
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, size: 35,),
                      onPressed: () => onDeleteEvent(event),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) {
      return 'N/A';
    }
    // Assuming the _formatTime function is correctly implemented
    return _formatTime(timeOfDay);
  }
}

class CreateEventScreen extends StatefulWidget {
  final Function(Event) onAddEvent;

  CreateEventScreen({required this.onAddEvent});

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  late DateTime selectedDate;
  late TimeOfDay selectedStartTime;
  late TimeOfDay selectedEndTime;
  late TextEditingController titleController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedStartTime = TimeOfDay.now();
    selectedEndTime = TimeOfDay.now();
    titleController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );

    if (picked != null) {
      setState(() {
        selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );

    if (picked != null) {
      setState(() {
        selectedEndTime = picked;
      });
    }
  }

  void createEvent() {
    String title = titleController.text;
    String startTime = DateFormat('hh:mm a').format(
      DateTime(0, 0, 0, selectedStartTime.hour, selectedStartTime.minute),
    );
    String endTime = DateFormat('hh:mm a').format(
      DateTime(0, 0, 0, selectedEndTime.hour, selectedEndTime.minute),
    );
    String notes = notesController.text;

    Event event = Event(
      date: selectedDate,
      title: title,
      startTime: startTime,
      endTime: endTime,
      notes: notes, time: '',
    );

    widget.onAddEvent(event);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),

            TextField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: DateFormat('yyyy-MM-dd').format(selectedDate),
              ),
            ),

            TextField(
              readOnly: true,
              onTap: () => _selectStartTime(context),
              decoration: InputDecoration(
                labelText: 'Start Time',
                hintText: DateFormat('hh:mm a').format(
                  DateTime(0, 0, 0, selectedStartTime.hour, selectedStartTime.minute),
                ),
              ),
            ),

            TextField(
              readOnly: true,
              onTap: () => _selectEndTime(context),
              decoration: InputDecoration(
                labelText: 'End Time',
                hintText: DateFormat('hh:mm a').format(
                  DateTime(0, 0, 0, selectedEndTime.hour, selectedEndTime.minute),
                ),
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: 'Notes',
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: createEvent,
              child: Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }
}

class Event {
  final DateTime date;
  final String title;
  final String time;
  final String notes;

  Event({
    required this.date,
    required this.title,
    required this.time,
    required this.notes, required String startTime, required String endTime
  });

  get startTime => null;
  get endTime => null;
}