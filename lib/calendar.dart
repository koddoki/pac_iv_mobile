import 'package:flutter/material.dart';
// Biblioteca para o uso do calendário
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:ondwaveda/login/data/provider.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
 
  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, List<CleanCalendarEvent>> events = Provider.of<EventProvider>(context, listen: false).event;
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: const ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],
          events: events,
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          todayColor: Colors.blue,
          eventColor: Colors.grey,
          locale: 'pt_BR',
          todayButtonText: 'Hoje',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          dayOfWeekStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}