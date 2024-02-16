class MusicModel{
  String? getMusicText(int condition){
    if(condition < 300){
      List<String> myNum = ['fKopy74weus','HBBv60P-hig','cokQYmeSij0','aCCSxtqxZww'];//천둥
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 600){
      List<String> myNum = ['aqLKX8JGQl0','MzxRN9SPLKM','dYV8bJWTBDc','pbNs7tAUFkk','hrO-BgLjJ-Q','ZsuX9aSst-4','XsPOehYKPPI'];//비
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 700){
      List<String> myNum = ['gset79KMmt0','VT_hLby9uSY','f3RWY32ooDg','hK5FCBGVZ6Y','m1mk1aMvwjs'];//눈
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 800){
      List<String> myNum = ['fKopy74weus','cHkDZ1ekB9U','Aq_gsctWHtQ','VHj6IYA-Dxs','HBBv60P-hig','cokQYmeSij0'];//안개
      myNum.shuffle();
      return myNum[0];
    }else if(condition == 800){
      List<String> myNum = ['c_10qS7amjk','TPakDMwld3I','i1p1O3JpIOw','prBG1BX2INE','8YAvVAAz6Rk','Ux3YVbjJ7iU'];//화창
      myNum.shuffle();
      return myNum[0];
    }else if(condition <= 804){
      List<String> myNum = ['hrO-BgLjJ-Q','ZsuX9aSst-4','XsPOehYKPPI','8YAvVAAz6Rk','Ux3YVbjJ7iU'];//구름
      myNum.shuffle();
      return myNum[0];
    }
    return null;
  }
}
class MusicModel2{
  String? getMusicText(int condition){
    if(condition < 300){
      List<String> myNum = ['fKopy74weus','HBBv60P-hig','cokQYmeSij0','aCCSxtqxZww'];//천둥
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 600){
      List<String> myNum = ['aqLKX8JGQl0','MzxRN9SPLKM','dYV8bJWTBDc','pbNs7tAUFkk'];//비
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 700){
      List<String> myNum = ['gset79KMmt0','VT_hLby9uSY','f3RWY32ooDg','hK5FCBGVZ6Y','m1mk1aMvwjs'];//눈
      myNum.shuffle();
      return myNum[0];
    }else if(condition < 800){
      List<String> myNum = ['fKopy74weus','cHkDZ1ekB9U','Aq_gsctWHtQ','VHj6IYA-Dxs'];//안개
      myNum.shuffle();
      return myNum[0];
    }else if(condition == 800){
      List<String> myNum = ['c_10qS7amjk','TPakDMwld3I','i1p1O3JpIOw','prBG1BX2INE'];//화창
      myNum.shuffle();
      return myNum[0];
    }else if(condition <= 804){
      List<String> myNum = ['hrO-BgLjJ-Q','ZsuX9aSst-4','XsPOehYKPPI'];//구름
      myNum.shuffle();
      return myNum[0];
    }
    return null;
  }
}