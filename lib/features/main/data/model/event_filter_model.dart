class EventFilter {
  int? limit;
  int? offset;
  int? id;
  String? dateFrom;
  String? dateTo;
  String? statusName;

  EventFilter({
    this.limit = 50,
    this.offset,
    this.id,
    this.dateFrom,
    this.dateTo,
    this.statusName,
  });

  EventFilter.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['offset'] = offset;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    data['statusName'] = statusName;
    return data;
  }
}
