class cuadro {
  FiguraCeleste c;
  FiguraRoja r;
  FiguraAzul z;
  FiguraAmarilla a;
  FiguraAmarilla b;
  FiguraAmarilla2 e;
  FiguraAmarilla2 d;
  FiguraNegra n;
  Fondo fondo;

  cuadro() {
    fondo = new Fondo();
    c =new FiguraCeleste();
    z = new FiguraAzul();
    r = new FiguraRoja();
    
    PVector posInicial = new PVector (width/2, height/2);
    a = new FiguraAmarilla(posInicial, 10);
    PVector posInicial2 = new PVector (width/2, height/2);
    b = new FiguraAmarilla(posInicial2, 10);
    
    
     PVector posInicial3 = new PVector (width/5, height/7);
    e = new FiguraAmarilla2(posInicial3, 10);
    PVector posInicial4 = new PVector (width/5, height/7);
    d = new FiguraAmarilla2(posInicial4, 10);
    
    n = new FiguraNegra();

  }

  void dibujarCuadro() {
    fondo.dibujar();
    c.dibujar(); 
    r.dibujar(); 
    z.dibujar();
    n.dibujarn();
    a.dibujar();
    b.dibujar();
    d.dibujar();  
    e.dibujar();  
    
    if (a.ColisionoConOtro(b)){
  strokeWeight(2);
  stroke(216,208,109);
  line (a.pos.x, a.pos.y, b.pos.x, b.pos.y);
    }
     if (d.ColisionoConOtro(e)){
  strokeWeight(2);
  stroke(216,208,109);
  line (d.pos.x, d.pos.y, e.pos.x, e.pos.y);
}


  }
  
  
  void moverCuadro() {
   if (amp > 80){
      c.mover((height-amp*2+1)>(height-amp*2));
      r.mover((height-amp*2+1)>(height-amp*2));
    } else if (amp < 80){
   n.tamano((amp+1)>amp);
  }
    
    if (pitch < 67){
    a.mover((pitch+1)>pitch);
    b.mover((pitch+1)>pitch);
    d.mover((pitch+1)>pitch);
    e.mover((pitch+1)>pitch);
    } else if (pitch > 67){
      z.mover((height-pitch*3+1)>(height-pitch*3));
    }
    
  }

void oscEvent(OscMessage m){
  if(m.addrPattern().equals("/amp")){
   amp = m.get(0).floatValue();
}

 if(m.addrPattern().equals("/pitch")){
   pitch = m.get(0).floatValue(); 
}
 }
}
