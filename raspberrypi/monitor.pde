import processing.serial.*;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
boolean error = false;
public void beginSerial() {
  try {
    String portName= Serial.list()[0];
    Serial microbit;
    microbit = new Serial(this, portName, 115200);
    microbit.clear();
    microbit.bufferUntil(10);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
}

double pre[]={0,0,0};
int  temp[]={0,0,0}, hum[]={0,0,0};
String time[]={"h:m:s","h:m:s","h:m:s"};
String name[]={"In house","Vinyl House","Outside"};
int up= 50;
void setup() {
  size(1500, 400);
   surface.setAlwaysOnTop(true);
  beginSerial();
}
void draw() {
  background(255);
  noStroke();
  fill(109, 179, 146);
  rect(0,0,width/3*2,height);
  fill(182, 237, 240);
  rect(0,0,width/3,height);
  fill(0,0,0,85);
  line(width/3, 0, width/3, height);
  line(width/3*2, 0, width/3*2, height);
  rect(0,0,width,50);
  
  for (int i = 0; i<3; i++) {
    fill(255);
    textAlign(CENTER);
    textSize(40);
    
    text(name[i],width/6+(width/3*i),40);
    fill(0);
    text("C",(width/3*i)+225,140);
    text("%",(width/3*i)+470,140);
    textSize(80);
    textAlign(RIGHT);
    text(temp[i], (width/3*i)+200, 140);
    text(hum[i],(width/3*i)+450, 140);
    textAlign(CENTER);
    text(String.format("%.1f",pre[i])+"Pa",width/6+(width/3*i),300);
    textSize(30);
    text("Updated on " + time[i],width/6+(width/3*i),380);
    
  }
}

void serialEvent(Serial microbit) {
  String packet = microbit.readStringUntil('\n');
  println(packet);
  String inData[] = split(packet, " ");
  for (int i=0; i <= inData.length-1; i++) {
    println(inData[i]);
  };
  println("inData[0] =" + inData[0]);
  int sw =0;
  switch(int(inData[0])) {
  case 216:
    sw=0;
    break;
  case 217:
    sw=1;
    break;
  case 218:
    sw=2;
    break;
  default:
    break;
  }
  String utime= hour() + ":" + minute() + ":" + second();
  time[sw] = utime;
  pre[sw] = float(inData[1])/100;
  hum[sw] = int(inData[3]);
  temp[sw] = int(inData[2]);
}
