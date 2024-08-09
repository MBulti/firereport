import 'package:firereport/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:firereport/models/models.dart';
import 'package:get/get.dart';

class DefectReportDetailPage extends StatefulWidget {
  const DefectReportDetailPage({super.key, this.report, this.index});
  final DefectReport? report;
  final int? index;

  @override
  State<DefectReportDetailPage> createState() => _DefectReportDetailPageState();
}

class _DefectReportDetailPageState extends State<DefectReportDetailPage> {
  final formKey = GlobalKey<FormState>();

  late String title;
  late String description;
  late ReportState status;
  DateTime? dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.report != null) {
      title = widget.report!.title;
      description = widget.report!.description;
      status = widget.report!.status;
    } else {
      title = "";
      description = "";
      status = ReportState.open;
    }
  }

  Future<void> selectDueDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      locale: Get.locale,
    );
    if (selectedDate != null) {
      setState(() {
        dueDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null
            ? 'Neuer Mängelbericht'
            : 'Mängelbericht bearbeiten'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(labelText: "Titel"),
                onSaved: (value) {
                  title = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte einen Titel eingeben';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: "Beschreibung"),
                onSaved: (value) {
                  description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte eine Beschreibung eingeben';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: status,
                decoration: const InputDecoration(labelText: "Status"),
                items: ReportState.values.map((status) {
                  return DropdownMenuItem(
                      value: status, child: Text(formatReportState(status)));
                }).toList(),
                onChanged: (newValue) {
                  status = newValue!;
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(dueDate == null
                    ? 'Bitte Fälligkeitsdatum auswählen'
                    : 'Datum: ${formatDate(dueDate!.toLocal())}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => selectDueDate(context),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    formKey.currentState!.save();
                    final newReport = DefectReport(
                      title: title,
                      description: description,
                      status: ReportState.open,
                      dueDate: dueDate,
                    );
                    Get.back(result: newReport);
                  },
                  child: Text(
                      widget.index == null ? 'Hinzufügen' : 'Aktualisieren')),
            ],
          ),
        ),
      ),
    );
  }
}
