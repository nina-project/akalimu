abstract class QueryParams {
  Map<String, dynamic> get params;
}

class UsersQueryParams extends QueryParams {
  static const String filterAll = "all";

  final int? limit;
  final int? offset;
  final String? filter;

  UsersQueryParams({this.limit, this.offset, this.filter});

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

class ClientsQueryParams extends QueryParams {
  static const String filterAll = "all";

  final int? limit;
  final int? offset;
  final String? filter;

  ClientsQueryParams({this.limit, this.offset, this.filter});

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
