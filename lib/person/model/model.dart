

class UserInfo{
  String nickName;
  String avatarUrl;
  bool sex;
  int age;
  String grade;
  String location;

  String intro;
  String edu;
  String tagetSchool;
  List<String> tags ;
  List<double> data ;
  int following ;
  int follower;
  int rank;
  int questionNum;

  UserInfo(
      {this.nickName = 'Redemptionc',
      this.avatarUrl = 'https://sssjody.oss-cn-beijing.aliyuncs.com/study/avatar.jpg',
      this.location = '上海市-浦东新区',
      this.sex = true,
      this.age = 16,
      this.intro = '这个人很懒,什么都没有留下～',
      this.edu = '莘格高级中学',
      this.grade = '七年级上',
      this.tagetSchool = '华中科技大学',
        this.tags ,
        this.data,
        this.following = 35,this.follower = 3762,
        this.rank =185 ,this.questionNum = 289
      }){
    this.data = [
      0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0,3.0,
      7.0,9.0,12.0,1.0,6.0,2.0,4.5,6.7,9.0,11.0,2.0,16.0,3.0,4.5,
      3.9,7.8,9.9,7.1
    ];
    this.tags = ["树",'深度优先搜索','广度优先搜索', '递归','数组','双指针'];
  }
}