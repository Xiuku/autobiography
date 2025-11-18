import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("ambient-technology.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text("我的自傳"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
                             type: BottomNavigationBarType.fixed,
                             backgroundColor: Colors.blue,
                             selectedItemColor: Colors.white,
                             selectedFontSize: 18,
                             unselectedFontSize: 14,
                             iconSize: 30,
                             currentIndex: currentIndex,
                             items: [
                               BottomNavigationBarItem(icon: currentIndex == 0? Image.asset('assets/about_me.png',width: 50,height: 50) : Image.asset('assets/about_me_in.png',width: 40,height: 40) , label:"自我介紹",),
                               BottomNavigationBarItem(icon: currentIndex == 1? Image.asset('assets/study_history.png',width: 50,height: 50) : Image.asset('assets/study_history_in.png',width: 40,height: 40) , label:"學習歷程",),
                               BottomNavigationBarItem(icon: currentIndex == 2? Image.asset('assets/study_plan.png',width: 50,height: 50) : Image.asset('assets/study_plan_in.png',width: 40,height: 40) , label:"學習計畫",),
                               BottomNavigationBarItem(icon: currentIndex == 3? Image.asset('assets/profession.png',width: 50,height: 50) : Image.asset('assets/profession_in.png',width: 40,height: 40) , label:"專業方向",),
                               //設定icon，選和不選(透明度調整)
                             ],
                             onTap: (index) {
                               setState(() {
                                 previousIndex=currentIndex;
                                 currentIndex=index;
                                 if (index==0) {
                                   if (previousIndex == currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("ambient-technology.mp3"));
                                 }
                                 if (index==1) {
                                   if (previousIndex == currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("designing-the-future.mp3"));
                                 }
                                 if (index==2) {
                                   if (previousIndex == currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("designing-the-future.mp3"));
                                 }
                                 if (index==3) {
                                   if (previousIndex == currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("digital-calm.mp3"));
                                 }
                                 //音樂設定

                               });
                             },
                           ),
    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1 = '我出生在一個大家庭，與祖父母、父母、妹妹一起長大，父母在成長路上非常開明且提供十足的支援，讓我能探索並發掘自己的興趣。\n'
              '小學畢業之前，我都一直在學習跆拳道。雖說沒有特別亮眼的成績，但也養成更好的體格。教練也不只訓練武藝，在學校成績、品德教育上也下了十足功夫，培養堅韌不拔的精神。\n'
              '國中開始回歸一般學生生活，就讀中壢國中。在此期間文科成績有明顯表現，但對於理科有更濃厚興趣，成為選擇高職就讀的原因。'
              '後就讀楊梅高中資訊科。\n高職期間，努力學習相關課業，成績也在前段班努力。因緣得到科系主任和老師的賞識，後續參與過一些系上的比賽和選手培訓。'
              '雖只在培訓階段和小比賽中表現，但也讓我認識到未來方向，也學習到很多事情，讓我在大學期間依舊能活用的知識。'
              '在高職期間，對於程式撰寫投入大量精力讓我十分想精進這項專長而選擇大學科系。\n目前就讀國立高雄科技大學資訊工程系，努力鑽研學業。';
  //撰寫自傳

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(//可捲動
       child: Column(
         children: [
           //title
           Padding(
             padding: EdgeInsets.fromLTRB(25, 30, 25, 50),
             child: Text("關於我", style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
           ),
           //自傳
           Container(
             padding: EdgeInsets.all(20),
             margin: EdgeInsets.fromLTRB(25, 3, 25, 50),
             decoration: BoxDecoration(
               border: Border.all(color: Colors.black54,width: 3,),
               borderRadius: BorderRadius.circular(10),
               boxShadow: [
                 BoxShadow(color: Colors.amberAccent,offset: Offset(6,6)),
               ]
             ),
             child: Text(s1, style: TextStyle(fontSize: 26),)
           ),
           SizedBox(height: 15,),
           Container(
             color: Colors.white,
             child: Image.asset('assets/C112152252.jfif'),//放置個人照片
             width: 200,
             height: 300,
           ),
           SizedBox(height: 25,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 width: 200,
                 height: 200,
                 decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple,width: 2,style: BorderStyle.solid,),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(image: AssetImage('assets/certificates_digiteletronics.jpg') , fit: BoxFit.cover),
                    //放置照片
                 ),
               ),
               SizedBox(width: 10,),
               Container(
                 width: 200,
                 height: 200,
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.purple,width: 2,style: BorderStyle.solid,),
                     borderRadius: BorderRadius.circular(30),
                     image: DecorationImage(image: AssetImage('assets/certificates_industrialEletronics.png') , fit: BoxFit.cover),
                     //放置照片
                 ),
               ),
             ],
           ),
         ],
       ),
     );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("高中時期", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("  1. 接觸電子、資訊領域", style: TextStyle(fontSize: 20),),
                      Text("  2. C語言、arduino等語言學習", style: TextStyle(fontSize: 20),),
                      Text("  3. 參與學校主辦的課外相關領域課程", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("大一", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("  1. 基礎教育課程", style: TextStyle(fontSize: 20),),
                      Text("  2. 程式語言學習: Python、C", style: TextStyle(fontSize: 20),),
                      Text("  3. 相關課程研習: Html、Css架構學習", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("大二", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("  1. 完成畢業英語門檻", style: TextStyle(fontSize: 20),),
                      Text("  2. 程式語言學習: Python、C++、Java", style: TextStyle(fontSize: 20),),
                      Text("  3. 專業課程: 資料結構、系統程式、離散數學、機率與統計、線性代數、微處理機", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("大三", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("  1. 程式語言學習: Python、dart", style: TextStyle(fontSize: 20),),
                      Text("  2. 網際網路應用: PacketTarcer", style: TextStyle(fontSize: 20),),
                      Text("  3. 專業課程: 演算法、影像處理、資料庫、作業系統", style: TextStyle(fontSize: 20),),
                      Text("  4. 實務專題開發", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("大一時期", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("‧ 學好英文", style: TextStyle(fontSize: 20),),
                      Text("‧ 程式語言學習", style: TextStyle(fontSize: 20),),
                      Text("‧ 相關課程延伸", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("大二時期", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("‧ 通過英文畢業門檻考試", style: TextStyle(fontSize: 20),),
                      Text("‧ 精進程式語言", style: TextStyle(fontSize: 20),),
                      Text("‧ 習得多種程式語言，增強競爭力", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("大三時期", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("‧ 程式語言學習", style: TextStyle(fontSize: 20),),
                      Text("‧ 網路系統架構", style: TextStyle(fontSize: 20),),
                      Text("‧ 實務專題研習", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("大四時期", style: TextStyle(fontSize: 26),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 400,
                  child: ListView(//列表檢視
                    children: [
                      Text("‧ 暑期&學期實習", style: TextStyle(fontSize: 20),),
                      Text("‧ 畢業條件課程補完", style: TextStyle(fontSize: 20),),
                      Text("‧ 就業方向確立", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("專業", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 400,
                child: ListView(//列表檢視
                  children: [
                    Text("1. C/C++、Java、Python程式語言", style: TextStyle(fontSize: 26),),
                    Text("2. 網路架構", style: TextStyle(fontSize: 26),),
                    Text("3. 資訊安全", style: TextStyle(fontSize: 26),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
