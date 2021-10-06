import 'package:eat_meat/util/date_picker_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int minuteInterval = 15;
  late DateTime minDate;
  late DateTime maxDate;
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now().roundUp();
    minDate = now;
    dateTime = now;
    maxDate = DateTime(
      now.year,
      now.month + 1,
      now.day,
      now.hour,
      now.minute,
    );
  }

  DateTime getDateTime({minuteInterval}) {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      minuteInterval,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Show Date Picker'),
      onPressed: () {
        DatePickerUtil.showSheet(
          context,
          child: buildDatePicker(),
          onPressed: () {
            final value = DateFormat('HH:mm dd.MM.yyyy').format(dateTime);
            DatePickerUtil.showSnackBar(context, 'Selected $value');
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Widget buildDatePicker() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        initialDateTime: dateTime,
        minimumDate: minDate,
        maximumDate: maxDate,
        mode: CupertinoDatePickerMode.dateAndTime,
        minuteInterval: minuteInterval,
        use24hFormat: true,
        onDateTimeChanged: (dateTime) =>
            setState(() => this.dateTime = dateTime),
      ),
    );
  }
}
