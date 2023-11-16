import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/local/custom.exception.dart';
import '../../../data/utils/exceptions/local/not_found.exception.dart';
import '../../repositories/ingredients/local/ingredients.local.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class SaveSearchUseCase extends UseCase<void, SaveSearchUseCaseParams> {
  final IngredientsLocalRepository ingredientsLocalRepository;

  const SaveSearchUseCase({
    required this.ingredientsLocalRepository,
  });

  @override
  Future<Either<DataException, void>> call(
    SaveSearchUseCaseParams params,
  ) async {
    try {
      var response = await ingredientsLocalRepository.saveSearchHistory(
        image: params.image != null
            ? await FlutterImageCompress.compressWithList(
                params.image!,
                quality: (50000 / params.image!.length * 100).toInt(),
              )
            : null,
        results: params.results,
      );

      return right(response);
    } on NotFoundLocalException catch (e) {
      return left(NotFoundLocalException(message: e.message));
    } on LocalException catch (e) {
      return left(CustomLocalException(message: e.message));
    }
  }
}

class SaveSearchUseCaseParams {
  final Uint8List? image;
  final List<int> results;

  const SaveSearchUseCaseParams({
    this.image,
    required this.results,
  });
}
