import 'package:bookly_app/core/errors/faliures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImp extends HomeRepo {
  // MAKE THAT TO GET THE GET METHOD FROM THE API SERVICE CLASS 
  final Apiservice  apiservice;
  HomeRepoImp(this.apiservice);
  @override
  Future<Either<Faliures, List<BookModel>>> fetchBestSellerBooks() async{
try{
      var data= await apiservice.get(endPoint: 'volumes?q=Programming&filter=free-ebooks&key=AIzaSyAvmfCN8XYVRNIEFj_zlrV6yspj493pOvA')
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return Right(books);

}
catch(e){
  return Left(ServerFaliures());


  }}

  @override
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks() {

  }

}