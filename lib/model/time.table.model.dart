// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: prefer_const_constructors

import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class TimeTable {
  final String title;
  final String time;
  final String adress;

  const TimeTable(
      {required this.title, required this.time, required this.adress});

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<TimeTable>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(timeTable);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 12, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 12, kToday.day);

final Map<DateTime, List<TimeTable>> timeTable = {
  DateTime(2023, 12, 20): [
    TimeTable(
        title: 'Lập trình di động', time: '07:00 AM', adress: 'Phòng 103'),
    TimeTable(
        title: 'Tiếng anh chuyên ngành', time: '09:00 AM', adress: 'Phòng 103'),
  ],
  DateTime(2023, 12, 22): [
    TimeTable(title: 'Lập trình nhúng', time: '07:00 AM', adress: 'Phòng 103'),
    TimeTable(title: 'Tiếng anh 2', time: '09:00 AM', adress: 'Phòng 103'),
  ],
  DateTime(2023, 12, 30): [
    TimeTable(title: 'Lập trình nhúng', time: '07:00 AM', adress: 'Phòng 103'),
    TimeTable(title: 'Tiếng anh 2', time: '09:00 AM', adress: 'Phòng 103'),
    TimeTable(title: 'Tiếng anh 2', time: '09:00 AM', adress: 'Phòng 103'),
    TimeTable(title: 'Tiếng anh 2', time: '09:00 AM', adress: 'Phòng 103'),
  ],
};
