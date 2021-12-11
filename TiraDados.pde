//Modulo TiraDados 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 21 de noviembre de 2021
//fecha de ultima modificación: 27 de noviembre de 2021
//comentario:
class TiraDados{
  int locriticvalue;
  int hicriticvalue;
  boolean islocritic;
  boolean ishicritic;
  
  TiraDados(){}
  
  //tiradas básicas con dados y monedas reales.
  int lanzaMoneda(){
    return int(random(1,3));
  }
  
  int tira(int li,int ls){
    int n;
    setCriticValues(li,ls);
    n=int(random(li,ls+1));
    checkCriticValues(n);
    return n;
  }
  
  int tiraD4(){
    return tira(1,4);
  }
  
  int tiraD6(){
    return tira(1,6);
  }
  
  int tiraD8(){
    return tira(1,8);
  }
  
  int tiraD10(){
return tira(1,10);
  }
  
  int tiraD12(){
    return tira(1,12);
  }
  
  int tiraD20(){
    return tira(1,20);
  }
  
  //aquí se pueden implementar tiradas de dados básicos combinados
  int tira2D6(){
    int n=tiraD6()+tiraD6();
    setCriticValues(2,12);
    checkCriticValues(n);
    return n;
  }
  
  //aquí se pueden poner datos para saber tiradas críticas, tanto numérico como
  //booleano
  boolean isLoCritic(){
    return islocritic;
  }
  
  boolean isHiCritic(){
    return ishicritic;
  }
  
  void setCriticValues(int l,int h){
    locriticvalue=l;
    hicriticvalue=h;
  }
  
  void checkCriticValues(int n){
    islocritic=(n==locriticvalue);
    ishicritic=(n==hicriticvalue);
  }
}
