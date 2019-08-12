// Read data from the serial port and assign it to a variable. Set the fill a 
// rectangle on the screen using the value read from a light sensor connected 
// to the Wiring or Arduino board 
 
import processing.serial.*; 
 
Serial port;  // Create object from Serial class
int val;      // Data received from the serial port 
int data = 0 ;

void setup() { 
  size(200, 200); 
  noStroke(); 
  frameRate(10);  // Run 10 frames per second
  println(Serial.list());
  port = new Serial(this, Serial.list()[1], 115200);
  port.bufferUntil('\n');
 
} 

void draw() { 
  val = data;
  background(204);                // Clear background
  fill(val);                      // Set fill color with the value read
  rect(50, 50, 100, 100);         // Draw square
} 

void serialEvent (Serial myPort) {
    // get the ASCII string:
    String line = myPort.readStringUntil('\n');

    if (line==null) return;
    line = trim(line);
    data = int(line);
    //println(data);
    data = data/4;
  }
