
import '../../entities/bookmark_entity.dart';
import '../../repositories/recent_repository.dart';

class GetRecentsUseCase {
  
  final RecentRepository _recentRepository;

  GetRecentsUseCase(this._recentRepository);

  Future<List<RecentSearchEntity>> call() => _recentRepository.getRecents();
}