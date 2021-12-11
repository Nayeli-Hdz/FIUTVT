//Modulo DatosDados
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 28 de noviembre de 2021
//fecha de ultima modificación: 28 de noviembre de 2021
//comentario:
class DatosDados{
  int caras[];
  int valor[];
  String []file;
  Dado df;      //dado fácil
  Dado dm;      //dado medio
  Dado dd;      //dado dificil
  
  DatosDados(){
    file=loadStrings("dicedata.dat");
    df=creaDado(EASY);
    dm=creaDado(MED);
    dd=creaDado(HARD);
  }
  
  Dado creaDado(int d){
    cargaDatosDado(d);
    return new Dado(caras,valor);
  }
  
  void cargaDatosDado(int d){
     switch(d){
      case EASY: cargaCV(0);
                 break;
      case MED:  cargaCV(2);
                 break;
      case HARD: cargaCV(4);
    }
  }
  
  void cargaCV(int l){
    String []s;
    s=split(file[l],',');
    caras=convierte(s);
    s=split(file[l+1],',');
    valor=convierte(s);
  }
  
  int[] convierte(String[]s){
    int[] v=new int[s.length];
    for(int i=0;i<v.length;i++)
      v[i]=int(s[i]);
    return v;
  }
  
  int tiraDado(int d){
    return d==EASY?df.tiraDado():d==MED?dm.tiraDado():dd.tiraDado();
  }
  
  int tiraDado(Personaje p){
    return p.lvl<cf.lvlesy?df.tiraDado():p.lvl<cf.lvlmed?dm.tiraDado():dd.tiraDado();
  }
  
  void printDado(int d){
    switch(d){
      case EASY: df.printDado();
                 break;
      case MED:  dm.printDado();
                 break;
      case HARD: dd.printDado();
    }
  }
}
