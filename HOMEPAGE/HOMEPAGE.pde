import controlP5.*;
 
ControlP5 cp5;
 
String url1;
 
void setup() {
  size(700, 400);
  cp5 = new ControlP5(this);
  cp5.addTextfield("Input your name").setPosition(230, 250).setSize(200, 40).setAutoClear(false);
  cp5.addBang("Submit").setPosition(380, 250).setSize(80, 40);    
 
}
 
 
void draw () {
  background(0);
}
 
void Submit() {
  print("the following text was submitted :");
  url1 = cp5.get(Textfield.class,"Input your name").getText();
  print(" Passport Holder Name = " + url1);
  println();
}