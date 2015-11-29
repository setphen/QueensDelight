import processing.pdf.*;
PFont myFont;
String[] lines;
PGraphicsPDF pdf;

void setup(){
  size(400,600, PDF, "Queens_Delight.pdf");
  noLoop();
  noStroke();
  
  myFont = createFont("Helvetica", 12);
  textFont(myFont);
  rectMode(CENTER);
  pdf = (PGraphicsPDF) g;
  lines = loadStrings("output.txt");
}

void draw(){
  
  textLeading(20);
  
  background(240);
  fill(20);
  textAlign(CENTER,CENTER);
  text("A Queens Delight", width/2, height/2);
  
  pdf.nextPage();
  
  for(int i = 0; i < lines.length; i++){
    
    color c = color(random(255),random(255),random(255));
    while(saturation(c) > 100){
      c = color(random(255),random(255),random(255));  
    }
    
    background(c);
    float R = red(c);
    float G = green(c);
    float B = blue(c);
    float lum = 0.2126*R + 0.7152*G + 0.0722*B;
    int f = lum > 150 ? 20 : 255;
    fill(f);
    String recipe = lines[i];
    textAlign(CENTER,CENTER);
    String hex = "#" + hex(c).substring(2);
    text(hex, width/2, height * 0.1, width-100, 40);
    text(hex, width/2, height * 0.9, width-100, 40);
    textAlign(LEFT,CENTER);
    text(recipe, width/2, height/2, width-100, height-200);
    pdf.nextPage();
  }

  background(240);
  fill(20);
  textAlign(CENTER,CENTER);
  text("November 2015\nNaNoGenMo", width/2, height/2);
  
  exit();
}