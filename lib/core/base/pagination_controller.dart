import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
abstract class PaginationController<T> extends GetxController {

  int perPage = 20;
  int page = 1;
  final pagingController = PagingController<int, T>(firstPageKey: 0);
  bool isRefresh = false;

  void getListData();

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      getListData();
    });
    super.onInit();
  }

  refreshPage() {
    page = 1;
    isRefresh = true;
    pagingController.refresh();
  }

  loadNextData(List<T> data) {
    final isLastPage = data.length < perPage;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      final nextPage = page++;
      pagingController.appendPage(data, nextPage);
    }
  }
}