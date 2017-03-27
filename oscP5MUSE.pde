/**
 * oscP5message by andreas schlegel
 * example shows how to create osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
PFont f,g;
OscMessage theOscMessage;
float rawValue; 
float blinkSeuil = 630;

int etape = 0;

OscP5 oscP5;
NetAddress myRemoteLocation;


void setup() {
  size(1280,512);//1280 1024
  frameRate(25);
  f = createFont("Avenir",50,true);
  g = createFont("Avenir",20,true);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,5000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("192.168.43.211",5000);
}



void mousePressed() {
  ///* in the following different ways of creating osc messages are shown by example */
  //OscMessage myMessage = new OscMessage("/test");
  
  //myMessage.add(123); /* add an int to the osc message */
  //myMessage.add(12.34); /* add a float to the osc message */
  //myMessage.add("some text"); /* add a string to the osc message */
  //myMessage.add(new byte[] {0x00, 0x01, 0x10, 0x20}); /* add a byte blob to the osc message */
  //myMessage.add(new int[] {1,2,3,4}); /* add an int array to the osc message */

  ///* send the message */
  //oscP5.send(myMessage, myRemoteLocation);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  if(theOscMessage.checkAddrPattern("/muse/eeg")==true) {
    rawValue = theOscMessage.get(0).floatValue();
    println(" raw[0]: "+rawValue);
  }
}

void draw() {
  /*if (!start) {
    background(0);
  }else{
     
    background(167); 
    textFont(f);
    text("BIENVENUE SUR RIVE", 400,380);
    if (rawValue < blinkSeuil) {
        background(167); 
        textFont(g);
        text("VOULEZ VOUS REPONDRE A CATHERINE DUPONT QUE VOUS AVEZ BIEN RECU", 300,200);
        text("SON FORMULAIRE ET QUE VOUS LE TRAITEREZ DES QUE POSSIBLE?", 345,230);
        text("OUI", 570, 330);
        text("NON", 570, 430);
        stroke(153);
        rect(500, 300, 40, 40);
        stroke(153);
        rect(500, 400, 40, 40);
    }
   }*/
   
   
   if (rawValue < blinkSeuil) {
     if(etape ==2 || etape == 4){
       etape++;
     }
    
     /*if(etape == 5){
        etape = 1; 
     }*/
   }
   
   println(etape);
   
   switch(etape){
     
      case 0 :
        background(0);
      break;
      case 1 :
        background(167); 
        textFont(f);
        text("BIENVENUE SUR RIVE", 400,380);
      break;
      case 2:
        background(167); 
        textFont(g);
        text("VOULEZ VOUS REPONDRE A CATHERINE DUPONT QUE VOUS AVEZ BIEN RECU", 300,200);
        text("SON FORMULAIRE ET QUE VOUS LE TRAITEREZ DES QUE POSSIBLE?", 345,230);
        text("OUI", 570, 330);
        text("NON", 570, 430);
        stroke(153);
        fill(255);
        rect(500, 300, 40, 40);
        stroke(153);
        rect(500, 400, 40, 40);
      break;
      case 3:
        background(167); 
        textFont(g);
        text("VOULEZ VOUS REPONDRE A CATHERINE DUPONT QUE VOUS AVEZ BIEN RECU", 300,200);
        text("SON FORMULAIRE ET QUE VOUS LE TRAITEREZ DES QUE POSSIBLE?", 345,230);
        text("OUI", 570, 330);
        text("NON", 570, 430);
        stroke(153);
        fill(255,0,0);
        rect(500, 300, 40, 40);
        stroke(153);
        rect(500, 400, 40, 40);
      break;
      case 4:
        background(167); 
        textFont(g);
        text("DEUXIEME QUESTION", 300,200);
        text("SON FORMULAIRE ET QUE VOUS LE TRAITEREZ DES QUE POSSIBLE?", 345,230);
        text("OUI", 570, 330);
        text("NON", 570, 430);
        stroke(153);
        fill(255);
        rect(500, 300, 40, 40);
        stroke(153);
        rect(500, 400, 40, 40);
      break;
      case 5:
        background(167); 
        textFont(g);
        text("DEUXIEME QUESTION", 300,200);
        text("SON FORMULAIRE ET QUE VOUS LE TRAITEREZ DES QUE POSSIBLE?", 345,230);
        text("OUI", 570, 330);
        text("NON", 570, 430);
        stroke(153);
        fill(255,0,0);
        rect(500, 300, 40, 40);
        stroke(153);
        rect(500, 400, 40, 40);
      break;
      
      default:
        background(255,230,200);
      break;
     
     
     
   }
     
}

void keyPressed () {
  // lancement du programme 
  if (key == ENTER) {
    if(etape == 0 || etape == 1 || etape == 3){
      etape++;
    }
  }

  // bouton stop 
  if (key == 's') {
    
    etape = 0;
  }
}