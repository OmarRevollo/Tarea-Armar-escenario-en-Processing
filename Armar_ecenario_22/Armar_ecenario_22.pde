PImage miImagen;
PImage imagenDisparo;
PImage imagenAsteroide;
ArrayList<Disparo> disparos;
ArrayList<Asteroide> asteroides; 

Jefe jefeFinal;
Nave_de_jugador imagenCursor;

void setup() {
  size(1000, 800);
  
  miImagen = loadImage("data/fondoimg.jpg");
  miImagen.resize(width, height);
  
  PImage imagenNave = loadImage("data/nave.png");
  imagenNave.resize(150, 100);
  imagenCursor = new Nave_de_jugador(imagenNave);
  
  PImage imagenJefeFinal = loadImage("data/94791.png");
  imagenJefeFinal.resize(1000, 300);
  jefeFinal = new Jefe(imagenJefeFinal);
  
  imagenDisparo = loadImage("data/disparo.png");
  imagenDisparo.resize(100, 100);
  
  imagenAsteroide = loadImage("data/meteorito.png");
  imagenAsteroide.resize(80, 80);
  
  disparos = new ArrayList<Disparo>();
  asteroides = new ArrayList<Asteroide>();
}

void draw() {
  tint(255, 0, 0); // Adds a red tint to the image
  image(miImagen, 0, 0); // Draws the image with the red tint
  noTint(); // Removes the tint for other images
  
  imagenCursor.mover();
  imagenCursor.mostrar();
  
  jefeFinal.mostrar();
  
  // Genera disparos aleatoriamente
  if (random(1) < 0.03) {
    Disparo nuevoDisparo = new Disparo(imagenCursor.x, -10);
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

class Jefe {
  PImage imagen;
  float x, y;

  Jefe(PImage imagen) {
    this.imagen = imagen;
    this.x = width / 2 - imagen.width / 2;
    this.y = -10;
  }

  void mostrar() {
    image(imagen, x, y);
  }
}

class Nave_de_jugador {
  PImage imagen;
  float x, y;

  Nave_de_jugador(PImage imagen) {
    this.imagen = imagen;
  }

  void mover() {
    x = mouseX;
    y = mouseY;
  }

  void mostrar() {
    image(imagen, x, y);
  }
}
