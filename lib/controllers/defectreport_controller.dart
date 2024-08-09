import 'package:firereport/models/models.dart';
import 'package:get/get.dart';

class DefectReportController extends GetxController {
  var reports = <DefectReport>[].obs;
  var filterStatus = FilterStatus.all.obs;

  void addNewReport(DefectReport report) {
    reports.add(report);
  }

  void updateReport(int index, DefectReport report) {
    reports[index] = report;
  }

  List<DefectReport> getReports() {
    switch (filterStatus.value) {
      case FilterStatus.all:
        return reports;
      case FilterStatus.open:
        return reports.where((report) => report.status == ReportState.open).toList();
      case FilterStatus.inProgress:
        return reports.where((report) => report.status == ReportState.inProgress).toList();
      case FilterStatus.done:
        return reports.where((report) => report.status == ReportState.done).toList();
      default:
        return reports;
    }
  }


}