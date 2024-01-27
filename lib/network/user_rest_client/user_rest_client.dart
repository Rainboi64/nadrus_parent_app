import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/data_models.dart';
import '../../models/responses/base_response/base_response.dart';

part 'user_rest_client.g.dart';

@RestApi()
abstract class UserRestClient {
  factory UserRestClient(Dio dio, {required String baseUrl}) = _UserRestClient;

  @POST("/auth/detect-tenant")
  Future<BaseResponse<DetectTenantResponse>> detectTenant({
    @Field("username") required String username,
    @Field("provider") required String provider,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST("/auth/login")
  Future<BaseResponse<LoginResponse>> login({
    @Field("username") required String username,
    @Field("password") required String password,
    @Field("provider") required String provider,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST("/verify-code")
  Future<BaseResponse<LoginResponse>> verifyCode({
    @Field("phone") required String number,
    @Field("verification_code") required String code,
    @CancelRequest() CancelToken? cancelToken,
  });

// @POST("/logout")
// Future<BaseResponse<dynamic>> logOut({
//   @Field("device_id") required String deviceId,
//   @Field("fcm_token") String? token,
//   @CancelRequest() CancelToken? cancelToken,
// });

// @POST("/user")
// Future<BaseResponse<User>> updateUser({
//   @Body() required FormData user,
//   @Part(name: "_method") String method = "PUT",
//   @Part(name: "full_name") required String fullName,
//   @Part(name: "city_id") required int cityId,
//   @Part(name: "email") String? email,
//   @Part(name: "file[0]") int? file,
//   @CancelRequest() CancelToken? cancelToken,
// });

  @GET("/auth/user")
  Future<BaseResponse<User>> getUser({
    @CancelRequest() CancelToken? cancelToken,
  });

// @POST("/user/fcm-token")
// Future<BaseResponse<dynamic>> setFcmToken({
//   @Field("fcm_token") required String token,
//   @Field("fcm_platform") required String platform,
//   @CancelRequest() CancelToken? cancelToken,
// });

// @DELETE("/user/fcm-token")
// Future<BaseResponse<dynamic>> removeFcmToken({
//   @CancelRequest() CancelToken? cancelToken,
// });
}
