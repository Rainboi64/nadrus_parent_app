import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../controllers/tenant_controller.dart';
import '../models/data/teacher_note/teacher_note.dart';
import '../models/responses/base_response/base_response.dart';
import '../network/teachers_notes_rest_client/teachers_notes_rest_client.dart';
import 'base_repository.dart';

class TeachersNotesRepository extends BaseRepository {
  /// Tenant Specific Url
  late final TeachersNotesRestClient teachersNotesRestClient;

  TeachersNotesRepository() {
    teachersNotesRestClient = TeachersNotesRestClient(GetIt.I.get<Dio>(),
        baseUrl: TenantController.baseUrl());
  }

  Future<BaseResponse<List<TeacherNote>>> getTeachersNotes(String id) {
    final cancelToken = CancelToken();
    return getResponse(
      () => teachersNotesRestClient
          .getTeachersNotes(id: id, cancelToken: cancelToken)
          .onError((error, _) => catchError<List<TeacherNote>>(error)),
      cancelToken: cancelToken,
    );
  }
}
