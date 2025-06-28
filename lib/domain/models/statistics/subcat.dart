class SubcategoryStatisticsResponse {
  bool? status;
  int? successCode;
  List<SubcategoryStatistic>?
      statisticsOfSubcategories; // Corrected to match JSON key "statistics of subcategories"
  String? successMessage;

  SubcategoryStatisticsResponse({
    this.status,
    this.successCode,
    this.statisticsOfSubcategories,
    this.successMessage,
  });

  factory SubcategoryStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return SubcategoryStatisticsResponse(
      status: json['status'] as bool?,
      successCode: json['success_code'] as int?,
      statisticsOfSubcategories: (json['statistics of subcategories']
              as List<dynamic>?)
          ?.map((e) => SubcategoryStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      successMessage: json['success_message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (statisticsOfSubcategories != null) {
      data['statistics of subcategories'] =
          statisticsOfSubcategories!.map((e) => e.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class SubcategoryStatistic {
  int? subcategoryId;
  String? subcategoryName;
  int? totalPriceLastMonth;
  int? totalQuantityLastMonth;
  String?
      percentage; // Can be parsed to double if arithmetic operations are needed

  SubcategoryStatistic({
    this.subcategoryId,
    this.subcategoryName,
    this.totalPriceLastMonth,
    this.totalQuantityLastMonth,
    this.percentage,
  });

  factory SubcategoryStatistic.fromJson(Map<String, dynamic> json) {
    return SubcategoryStatistic(
      subcategoryId: json['subcategory_id'] as int?,
      subcategoryName: json['subcategory_name'] as String?,
      totalPriceLastMonth: json['total_price_last_month'] as int?,
      totalQuantityLastMonth: json['total_quantity_last_month'] as int?,
      percentage: json['percentage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['total_price_last_month'] = totalPriceLastMonth;
    data['total_quantity_last_month'] = totalQuantityLastMonth;
    data['percentage'] = percentage;
    return data;
  }
}
