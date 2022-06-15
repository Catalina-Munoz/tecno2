//Declaracion
class FiguraCeleste {

  //Atributos
  float x, y;
  int maxImages = 7;
  int imageIndex = 0;
  float tam;
  PImage [] images = new PImage[maxImages];

  //Constructor
  FiguraCeleste() {
    x=200;
    y= 200;
    tam=80;

  for (int i =0; i < images.length; i++) {
  images[i] = loadImage("c_" + i + ".png");
  }

  //frameRate(15);
 imageMode(CENTER);
 
  }
 void dibujar() {
    image(images[imageIndex], x, y, tam*4, tam*4);
      println(frameCount,frameCount%60,frameCount%60==0);
    if(frameCount%5==0){
    imageIndex = (imageIndex+1)%images.length;
    }
    image(images[imageIndex], x*3, y*3);
    //imageIndex = (imageIndex+1)%images.length;

  } 

  void mover(boolean condicion ) {
    if (condicion) {
      x++;
 } 
  
  if (x>=width){
    x= 0 + tam;
  }
}
}
