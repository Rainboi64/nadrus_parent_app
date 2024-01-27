import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/data/teacher_note/teacher_note.dart';
import '../../models/responses/base_response/base_response.dart';

part 'teachers_notes_rest_client.g.dart';

@RestApi()
abstract class TeachersNotesRestClient {
  factory TeachersNotesRestClient(Dio dio, {required String baseUrl}) =
      _TeachersNotesRestClient;

  @GET("/students/{id}/feedback")
  Future<BaseResponse<List<TeacherNote>>> getTeachersNotes({
    @Path() required String id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
