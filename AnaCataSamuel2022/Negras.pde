class FiguraNegra{
  
//Atributos
  float x, y;
  float tam1, tam2;
  PImage imgnegra;
  
 //Constructor
 FiguraNegra(){
 x=120;
 y= 100;
 tam1=20;
 tam2=20;
 imgnegra = loadImage("negro1.png");
 }
 
  void dibujarn (){
  image( imgnegra, x, y,tam1,tam2);
  image( imgnegra, x*6, y*6,tam1,tam2);
  image( imgnegra, x*3, y*4,tam1,tam2);
  }
  
  void tamano(boolean condicion ) {
    if (condicion) {
      tam1++;
    }  
    if (tam1>=200){
    tam1=20;
  }
  }
}
