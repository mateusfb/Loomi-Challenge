abstract class IPutCartItemUsecase {
  Future<void> call(int id, Map<String, int> quantityMap);
}
