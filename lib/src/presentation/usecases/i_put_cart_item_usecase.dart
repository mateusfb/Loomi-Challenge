abstract class IPutCartItemUsecase {
  Future<void> call(String id, Map<String, int> quantityMap);
}
