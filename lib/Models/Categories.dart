

class Categories{
  String name;
  String image;
  String id;

  Categories({required this.name, required this.image, required this.id});




  static List<Categories> cateItem = [
    Categories(
        name: 'mydata',
        image:
        'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/programing.png?alt=media&token=f904f69b-fe0c-49c5-96d8-4ac338653ffd',
        id: '1'),
    Categories(
        name: 'mydata Design',
        image:
        'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/designing.png?alt=media&token=342a62f3-d10c-447d-bdce-7fe23b3da6fe',
        id: '2'),
    Categories(
        name: 'muUi/Ux',
        image:
        'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/uiux.png?alt=media&token=e499d13b-9579-4108-9c19-f738c6c7b123',
        id: '3'),
    Categories(
        name: 'njjCyber Security',
        image:
        'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/Cyber.png?alt=media&token=71f22c71-58fe-4f9b-a941-d6d1d3dea62a',
        id: '4'),
    Categories(
        name: 'jjjjjCloud Computing',
        image:
        'https://firebasestorage.googleapis.com/v0/b/examaster-f826a.appspot.com/o/computing.png?alt=media&token=6b187814-79dd-4272-bf21-b7713863b8c4',
        id: '5')
  ];
}