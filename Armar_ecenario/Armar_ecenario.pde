PImage fondo;
PImage personaje;
float personajeX, personajeY;
float velocidadPersonaje = 5;
float reboteX, reboteY;
float velocidadReboteX = 3;

void setup() {
  size(800, 600);
  fondo = loadImage("fondo.jpg"); // Carga tu imagen de fondo
  personaje = loadImage("personaje.png"); // Carga tu imagen de personaje
  personajeX = width / 2;
  personajeY = height - personaje.height;
  reboteX = random(width); // Inicializa la posición de rebote en X
  reboteY = random(height / 2); // Inicializa la posición de rebote en Y
}

void draw() {
  background(255);
  image(fondo, 0, 0); // Dibuja la imagen de fondo
  
  // Mueve el personaje con las teclas del mouse
  personajeX = constrain(personajeX + velocidadPersonaje * (mouseX - personajeX), 0, width - personaje.width);
  personajeY = constrain(personajeY + velocidadPersonaje * (mouseY - personajeY), 0, height - personaje.height);
  image(personaje, personajeX, personajeY);
  
  // Mueve la imagen de rebote de izquierda a derecha
  reboteX += velocidadReboteX;
  if (reboteX < 0 || reboteX > width) {
    velocidadReboteX *= -1; // Cambia la dirección al llegar a los bordes
  }
  image(personaje, reboteX, reboteY);
  
  // Dibuja el piso de bloques
  for (int i = 0; i < width; i += 40) {
    rect(i, height - 20, 40, 20);
  }
  
  // Dibuja nubes o estrellas aleatorias en el cielo
  for (int j = 0; j < 10; j++) {
    float nubeX = random(width);
    float nubeY = random(height / 2);
    ellipse(nubeX, nubeY, 30, 30);
  }
}
