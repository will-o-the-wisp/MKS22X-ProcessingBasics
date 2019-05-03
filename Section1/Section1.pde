int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[35];
    speeds = new float[35];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  Visualizer(float x, float y, int bars) {
    this.x = x;
    this.y = y;
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.
    for(int i=0;i<values.length;i++){
      fill(Math.abs(values[i])*255/100,255-Math.abs(values[i])*255/100,0);
      rect(x+400*i/values.length,y+100-values[i],400/values.length,values[i]);
    }
    //???WRITE THIS METHOD!!!
    //THESE ARE WRONG: They just illustrate how they could look
    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i];
      //??? keep them values between max/min value
      if(values[i]<MIN_VALUE){
        values[i]=MIN_VALUE;
      }
      if(values[i]>MAX_VALUE){
        values[i]=MAX_VALUE; 
      }
      //??? reverse the speeds so they oscillate up/down when they reach max/min
      if(values[i]==MIN_VALUE||values[i]==MAX_VALUE){
        speeds[i]*=-1;
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 35);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
