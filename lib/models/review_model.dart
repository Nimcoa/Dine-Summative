class ReviewModel {
  final String userName;
  final String comment;

  ReviewModel({required this.userName, required this.comment});

  static final List<ReviewModel> dummyData = [
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
    ReviewModel(
      userName: 'User name',
      comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    ),
  ];
}
