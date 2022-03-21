class CountRepository {
  Future<int> getCount() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    return 10;
  }

  Future<int> increase(count) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return count + 1;
  }

  Future<int> decrease(count) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    return count - 1;
  }
}
