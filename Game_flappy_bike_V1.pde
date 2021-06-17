float score = 0;
float dscore = 0.5;
String text1 = "";
float randa;
float randb;
float randc;

float x = 300;
float y = 500; //Y position
float dy;
float jumpingspeed = -6;
float dx = 0;
float x3;


float te;

float x1 = 1;
float dx1 = -15; 
float y1 = 1000;
float w = 0;


float h1 = -(random(300, 700)); //Bottom
float h2 =  random(300, 700);

float r=235;
float g=62;
float b=52;


void setup () {
  frameRate(1000);
  size(1920, 1000);
}



void draw () {

  scale (0.8);
  //ENVIRONMENT
  fill(31, 180, 255);
  rect (0, 0, 5000, 1000); //Setup sky


  //Moving obstacles

  x1 = x1 + dx1;


  //OBSTACLE 1
  fill(0, 69, 34);
  rect (x1, y1, w, h1); //Bottom




  //Stopping game 1

  if ((x + 125) >= x1 && (x - 20) <= (x1 + w) && (y+20) >= y1 + h1) {
    dx1 = 0;
    dy = 50;
    dscore = 0;
    jumpingspeed = -jumpingspeed;
    text1 = "Press 'R' to play again";
    textSize(30);
    text (text1, 500, 500);
  }

  //Stopping game 2 
  if ((x + 125) >= x1 && (x - 20) <= (x1 + w) && (y-110) <= h2) {
    dx1 = 0;
    dy = 50;
    dscore = 0;
    jumpingspeed = -jumpingspeed;
    text1 = "Press 'R' to play again";
    textSize(30);
    text (text1, 500, 500);
  }

  fill(74, 54, 0);
  rect (0, 900, 5000, 1000); //Setup land



  //OBSTACLE 2
  fill (0, 69, 34);
  rect (x1, 0, w, h2);


  if (x1 + w <= 0) {
    w = 150;
    h1 = -(random(100, 600));
    h2 =  random(100, 650);
    x1 = 2400;
    dx1 += - 0.1;
    randa = random(300,2200);
    randb = random(200,2200);
    randc = random(100,2200);
    
    jumpingspeed += -0.001;
    
  } //Pass 0 position on x-axis


  //TESTING TEXTS
  //text ("Distance:"+( abs(h2 - (y1 + h1))), 500, 500);

  //text ("H1:"+(y1+h1), 300, (y1+h1));
  //text ("H2:"+(h2), 300, h2);



  //Hiding & Surprising
  if (x1<= (randa) && abs(h2 - (y1 + h1)) <= 300) {
    h2 = h2 - random(60, 100);
    h1 = h1 + random(60, 100);
  }
  
  
  if (x1<= (randb) && abs(h2 - (y1 + h1)) >= 400) {
    h2 = h2 + random(60, 100);
    h1 = h1 - random(60, 100);
  }
  
  
  if (x1<= (random(300,600)) && abs(h2 - (y1 + h1)) >= 500) {
    h2 = h2 + random(-60, 70);
    h1 = h1 - random(-60, 70);
  }



  //SCORE
  fill(255, 0, 0);
  textSize(50);
  text ("SCORE:"+score, 500, 100);
  if (x >= (x1 + w)) {
    score = round(score + dscore);
  }






  //BICYCLE
  //Set up bicycle

  cb (x, y);
  scale (1);
  //Setup Jummping
  y += dy; //Jump
}





//Code bicycle
void c1 (float x, float y) {

  strokeWeight(6);
  stroke(0, 0, 0);
  noFill();
  circle(x, y, 50);
  strokeWeight(3);
  line(x-25, y, x+25, y);
  line(x, y-25, x, y+25);
  line(x-17.68, y-17.68, x, y);
  line(x+17.68, y+17.68, x, y);
  line(x+17.68, y-17.68, x-17.68, y+17.68);
}

void fr (float x, float y) {

  strokeWeight (5);
  stroke(r, g, b);
  line(x, y, x+25, y-37.5);
  line(x+25, y-37.5, x+75.5, y-37.5);
  line(x, y, x+55, y);
  line(x+55, y, x+75.5, y-37.5);
  line(x+75.5, y-37.5, x+100, y);
  line(x+100, y, x+66, y-50);
  circle(x+66, y-50, 5);
  rect(x+20, y-45.5, 10, 3);
  circle(x+25, y-37.5, 6);
  circle(x+55, y, 20);
  line(x+55, y, x+25, y-37.5);


  stroke(0, 0, 0);
  strokeWeight(13);
  line(x+20, y-45.5, x+50, y-25);
  line(x+50, y-25, x+50, y);
  strokeWeight(20);
  line(x+20, y-45.5, x+30, y-85);
  strokeWeight (10);
  line(x+30, y-75, x+60, y-44);
  stroke(0, 0, 0);
  fill(0, 0, 0);

  circle(x+38, y-100, 10);
  noStroke();
  fill(0, 0, 0);
  circle(x+20, y-45.5, 25);
}
void cb (float x, float y) {

  c1(x, y);
  c1(x+100, y);
  fr (x, y);
}

void keyPressed () {
  if (key == ' ') {
    dy = jumpingspeed; //setup jumpingspeed
  }

  if (key == 'r') {
    x1 = 1 - w;
    dx1 = -15;
    dy = 0;
    x = 100;
    y = 500;
    score = 0;
    dscore = 0.5;
    jumpingspeed = -6;
    text1 = "";
  }
}
void keyReleased () {
  if (key == ' ') {
    dy = -dy; //setup jumpingspeed
  }
}
