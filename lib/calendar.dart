import 'package:flutter/material.dart';
// Biblioteca para o uso do calendário
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  final Map<DateTime, List<CleanCalendarEvent>> _events = {

    // Cria um evento de placeholder apenas para observação de como a aplicação exibe os dados

    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+1): [
      CleanCalendarEvent('Evento Importante!',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 21, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 23, 59),
          description: 'O dia que a gente vai se reunir pra fazer o trabalho',
          color: Colors.blue),
    ],
  };

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: const ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],
          events: _events,
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