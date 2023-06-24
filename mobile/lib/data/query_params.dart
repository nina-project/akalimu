abstract class QueryParams {
  Map<String, dynamic> get params;
}

class JobsQueryParams extends QueryParams {
  static const String filterAll = "all";

  final int? limit;
  final int? offset;
  final String? filter;

  JobsQueryParams({this.limit, this.offset, this.filter});

  @override
  Map<String, dynamic> get params {
    final Map<String, dynamic> map = {};
    if (limit != null) {
      map["limit"] = limit;
    }
    if (offset != null) {
      map["offset"] = offset;
    }
    if (filter != null) {
      map["filter"] = filter;
    }
    return map;
  }
  
}