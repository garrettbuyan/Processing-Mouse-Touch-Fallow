/*
import org.openkinect.*;
import org.openkinect.processing.*;
import org.openkinect.*;
import org.openkinect.processing.*;
Kinect kinect;
*/
float x;
float y;
float yspeed = 0;
float xspeed = 0;
float spin;
float imgdiameter = 100;
float imgradius = imgdiameter/2;
PImage img;
void setup() {
/*
kinect = new Kinect(this);
kinect.start();
*/

size(displayWidth - 100, displayHeight - 100);
background(0);
img = loadImage("swirl.png");
x = width/2;
y = height/2;
}
void draw() {
background(0);
checkMouse();
boundaryChecks();
}
void checkMouse() {
if (mousePressed == true) {
x = mouseX;
y = mouseY;
yspeed = mouseY - pmouseY;
xspeed = mouseX - pmouseX;
imageSpin();
} 
else {
imageFunctions();
}
}
void boundaryChecks() {
//bottom
if (y >= height - imgdiameter) {
y = height - imgdiameter;
yspeed = -yspeed/1.15;
}
//top
if (y <= 0) {
y = 0;
yspeed = -yspeed/1.35;
}
//right
if (x >= width -imgdiameter) {
x = width -imgdiameter;
xspeed = -xspeed/1.10;
}
//left
if (x <= 0) {
x = 0;
xspeed = -xspeed/1.10;
}
}
void imageSpin() {
translate(mouseX, mouseY);
rotate(spin);
image(img, -50, -50, 100, 100);
spin = dist(mouseX, mouseY, -width, -height)/30;
}
void imageFunctions() {
image(img, x, y, imgdiameter, imgdiameter);
if (imgdiameter < 2) {
imgdiameter = 2;
}
if (imgdiameter > 400) {
imgdiameter = 400;
}
imgradius = imgdiameter/2;
yspeed = yspeed += 0.2;
xspeed = xspeed/1.005;
y = y + yspeed;
x = x + xspeed;
}
