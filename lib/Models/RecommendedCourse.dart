class Recommendedcourse {

  String namerecommended;
  String imageofitem;
  String idofrecommended;
  String Rating;

  Recommendedcourse({
    required this.namerecommended,
    required this.imageofitem,
    required this.idofrecommended,
    required this.Rating,
  });

  static List<Recommendedcourse> Recommendeditem = [
    Recommendedcourse(
      namerecommended: 'Programming',
      imageofitem:
      'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/programing.png?alt=media&token=f904f69b-fe0c-49c5-96d8-4ac338653ffd',
      idofrecommended: '1',
      Rating: '4.5k',
    ),
    Recommendedcourse(
      namerecommended: 'Cyber Security',
      imageofitem:
      'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/Cyber.png?alt=media&token=71f22c71-58fe-4f9b-a941-d6d1d3dea62a',
      idofrecommended: '2',
      Rating: '4.3k',
    ),
    Recommendedcourse(
      namerecommended: 'Ethical hacking',
      imageofitem:
      'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/haking.png?alt=media&token=7832e39d-5a71-4466-81ae-f15ef188d795',
      idofrecommended: '3',
      Rating: '1.1k',
    ),
    Recommendedcourse(
      namerecommended: 'Graphic Designing',
      imageofitem:
      'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/designing.png?alt=media&token=342a62f3-d10c-447d-bdce-7fe23b3da6fe',
      idofrecommended: '4',
      Rating: '4.2k',
    ),
    Recommendedcourse(
      namerecommended: 'Cloud Computing',
      imageofitem:
      'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/computing.png?alt=media&token=6b187814-79dd-4272-bf21-b7713863b8c4',
      idofrecommended: '5',
      Rating: '3.5k',
    ),
  ];
  
  
}