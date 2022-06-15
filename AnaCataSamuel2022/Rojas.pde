//Declaracion
class FiguraRoja {

  //Atributos
  float x, y;
  float tam;
  int maxImages = 8;
  int imageIndex = 0;
  PImage [] images = new PImage[maxImages];

  //Constructor
  FiguraRoja() {
    x=50;
    y= 100;
    tam=50;


  for (int i =0; i < images.length; i++) {
  images[i] = loadImage("r_" + i + ".png");
  }

 //frameRate(10);
 imageMode(CENTER);
 
  }

  void dibujar() {
    image(images[imageIndex], x*8, y, tam*4, tam);
     println(frameCount,frameCount%60,frameCount%60==0);
    if(frameCount%5==0){
    imageIndex = (imageIndex+1)%images.length;

    }
    image(images[imageIndex], x, y*5, tam*4, tam*2);
   // imageIndex = (imageIndex+1)%images.length;

    image(images[imageIndex], x*14, y*3, tam*6, tam*3);
   // imageIndex = (imageIndex+1)%images.length;

  }

  void mover(boolean condicion ) {
    if (condicion) {
      x--;
  } 
 if (x<-tam){
    x= width + tam;
  }
}
}
