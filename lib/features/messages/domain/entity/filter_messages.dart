class MessageFilter {
  int? id;
  String? dateFrom;
  String? dateTo;

  MessageFilter({
    this.id,
    this.dateFrom,
    this.dateTo,
  });

  MessageFilter.fromJson(Map<String, dynamic> json) {
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    return data;
  }
}
