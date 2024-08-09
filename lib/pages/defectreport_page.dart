import 'package:firereport/pages/pages.dart';
import 'package:firereport/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firereport/controllers/controllers.dart';
import 'package:firereport/models/models.dart';

class DefectReportListPage extends StatelessWidget {
  const DefectReportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DefectReportController controller = Get.put(DefectReportController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mängelberichte'),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Get.to(const SettingsPage()))
        ],
      ),
      body: Column(
        children: [
          // dropdown
          Padding(
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => DropdownButtonFormField(
                value: controller.filterStatus.value,
                items: FilterStatus.values.map((status) {
                  return DropdownMenuItem(
                      value: status,
                      child: Text(formatFilterState(status)));
                }).toList(),
                onChanged: (newValue) {
                  controller.filterStatus.value = newValue!;
                },
                decoration: const InputDecoration(
                  labelText: 'Nach Status filtern',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          // report list
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.getReports().length,
                itemBuilder: (context, index) {
                  final report = controller.getReports()[index];
                  return GestureDetector(
                    onTap: () async {
                      final updatedReport =
                          await Get.to(() => DefectReportDetailPage(
                                report: report,
                                index: index,
                              ));
                      if (updatedReport != null) {
                        controller.updateReport(index, updatedReport);
                      }
                    },
                    child: DefectReportListItem(report: report),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReport = await Get.to(() => const DefectReportDetailPage());
          if (newReport != null) {
            controller.addNewReport(newReport);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DefectReportListItem extends StatelessWidget {
  final DefectReport report;
  const DefectReportListItem({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(height: 8),
            Text(report.description),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status: ${formatReportState(report.status)}'),
                Text(
                    'Fällig am: ${report.dueDate != null ? formatDate(report.dueDate!.toLocal()) : 'Kein Datum'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
