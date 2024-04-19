PImage miImagen;
PImage imagenCursor;
PImage jefeFinal;
PImage imagenDisparo;
PImage imagenAsteroide;
ArrayList<Disparo> disparos;
ArrayList<Asteroide> asteroides; 
float imgX, imgY;

void setup() {
  size(1000, 800);
  miImagen = loadImage("data/fondoimg.jpg");
  miImagen.resize(width, height);
  
  imagenCursor = loadImage("data/nave.png");
  imagenCursor.resize(150, 100);
  
  jefeFinal = loadImage("data/94791.png");
  jefeFinal.resize(1000, 300);
  
  imagenDisparo = loadImage("data/disparo.png");
  imagenDisparo.resize(100, 100);
  
  imagenAsteroide = loadImage("data/meteorito.png");
  imagenAsteroide.resize(80, 80);
  
  imgX = width / 3;
  imgY = height / 3;
  
  disparos = new ArrayList<Disparo>();
  asteroides = new ArrayList<Asteroide>();
}

void draw() {
  background(miImagen);
  imgX = mouseX;
  imgY = mouseY;
  
  image(imagenCursor, imgX, imgY);
  image(jefeFinal, width / 2 - jefeFinal.width / 2, -10);
  
  // Genera disparos aleatoriamente
  if (random(1) < 0.03) {
    Disparo nuevoDisparo = new Disparo(imgX, -10);
    disparos.add(nuevoDisparo);
  }
  
  // Mueve y muestra los disparos
  for (int i = disparos.size() - 1; i >= 0; i--) {
    Disparo d = disparos.get(i);
    d.mover();
    d.mostrar();
    if (d.y > height) {
      disparos.remove(i);
    }
  }
  
  // Genera meteorito aleatoriamente 
  if (asteroides.size() < 3 && random(1) < 0.03) {
    Asteroide nuevoAsteroide = new Asteroide();
    asteroides.add(nuevoAsteroide);
  }
  
  // Mueve y muestra los asteroides
  for (int i = asteroides.size() - 1; i >= 0; i--) {
    Asteroide a = asteroides.get(i);
    a.mover();
    a.rebotar(); 
    a.mostrar();
  }
}

class Disparo {
  float x, y;
  float velocidad = 4;
  
  Disparo(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void mover() {
    y += velocidad;
  }
  
  void mostrar() {
    image(imagenDisparo, x, y);
  }
}

class Asteroide {
  float x, y;
  float velocidadX = 2;
  float diametro = 80;
  
  Asteroide() {
    x = random(diametro / 2, width - diametro / 2);
    y = random(height / 2, height - 100);
  }
  
  void mover() {
    x += velocidadX;
  }
  
  void rebotar() {
    if (x < diametro / 2 || x > width - diametro / 2) {
      velocidadX *= -1; // Cambia la dirección al colisionar con los bordes
    }
  }
  
  void mostrar() {
    image(imagenAsteroide, x - diametro / 2, y - diametro / 2);
  }
}
