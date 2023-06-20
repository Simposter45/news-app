import 'package:news_app/models/explore_model.dart';

List<ExploreModel> getCategories() {
  List<ExploreModel> categories = <ExploreModel>[];
  ExploreModel exploreModel;

  //1
  exploreModel = new ExploreModel();
  exploreModel.image = 'assets/images/philosophy.jpg';
  exploreModel.text = 'Philosophy';
  categories.add(exploreModel);

  //2
  exploreModel = new ExploreModel();
  exploreModel.image = 'assets/images/philosophy.jpg';
  exploreModel.text = 'Philosophy';
  categories.add(exploreModel);

  //3
  exploreModel = new ExploreModel();
  exploreModel.image = 'assets/images/philosophy.jpg';
  exploreModel.text = 'Philosophy';
  categories.add(exploreModel);

  //4
  exploreModel = new ExploreModel();
  exploreModel.image = 'assets/images/philosophy.jpg';
  exploreModel.text = 'Philosophy';
  categories.add(exploreModel);

  //5
  exploreModel = new ExploreModel();
  exploreModel.image = 'assets/images/philosophy.jpg';
  exploreModel.text = 'Philosophy';
  categories.add(exploreModel);

  return categories;
}
