export 'api_response.dart';
export 'base_datasource.dart';
export 'failures.dart';
export 'exceptions.dart';

import 'api_response.dart';

typedef Future<ApiResponse<bool>> StatusOnlyApiResponse(params);
typedef Future<ApiResponse<T>> DataApiResponse<T>();