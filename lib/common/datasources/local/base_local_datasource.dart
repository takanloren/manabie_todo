abstract class BaseLocalDataSource<ModelType>{
  Future<ModelType?> get(String key);

  Future<List<ModelType>> getAll();

  Future<void> put(String key, ModelType value);

  Future<void> putAll(Map<String, ModelType> items);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<List<String>> get keys;

  Future<int> add(ModelType todoModel);

  Future<void> deleteAtIndex(int index);
}