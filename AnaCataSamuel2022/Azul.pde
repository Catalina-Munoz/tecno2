class FiguraAzul {

  //Atributos
  float x, y;
  int maxImages = 8;
  int imageIndex = 0;
  PImage [] images = new PImage[maxImages];

  //Constructor
  FiguraAzul () {
    x=200;
    y= 200;

    for (int i =0; i < images.length; i++) {
      images[i] = loadImage("a_" + i + ".png");
    }

    //frameRate(15);
    imageMode(CENTER);
  }
  void dibujar() {
    image(images[imageIndex], x, y);
    //println(frameCount,frameCount%60,frameCount%60==0);
    if (frameCount%5==0) {
      imageIndex = (imageIndex+1)%images.length;
    }

    image(images[imageIndex], x*2, y*3);
    //imageIndex = (imageIndex+1)%images.length; solo muevo un frame por frame esta linea esta mal
  }
  void mover(boolean condicion ) {
    if (condicion) {
      x+=5;
    }
  }
}
