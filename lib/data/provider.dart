import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';



class EventProvider extends ChangeNotifier{
  final Map<DateTime, List<CleanCalendarEvent>> _events = {
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

  Map<DateTime, List<CleanCalendarEvent>> get event => _events;
}

