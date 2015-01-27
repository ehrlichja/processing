import com.onformative.yahooweather.*;

YahooWeather weather;
int updateIntervallMillis = 60000*60; 
int lastSecond;
int second;

float sunrise;
float sunset;

color daylightColor;
color hoursColor;
color minutesColor;
color secondsColor;

int timeStroke=20;

void setup() {
  
  size(800, 480);
  weather = new YahooWeather(this, 2487956, "c", updateIntervallMillis);
  
}

void draw() {
  
  second = second();
  if (second != lastSecond) {
    drawTime();
    lastSecond = second;
  }

}

void drawTime() {
  
  sunrise = setSunrise();
  sunset = setSunset();
  setTheme4();
  background(0);
  gridLines();
  // Daylight
  noStroke();
  fill(daylightColor);
  arc(width/2, height/2, (width/8)*2, (width/8)*2, radians(-90+(15*sunrise)), radians(-90+(15*sunset)), PIE);
  
  noFill();
  strokeWeight(timeStroke);
  strokeCap(SQUARE);
  
  // HOURS
  stroke(hoursColor);
  float hour = hour() + minute()/60.0;
  arc(width/2, height/2, (width/8)*2, (width/8)*2, radians(-90), radians(-90+(15*hour)));   

  // MINUTES
  stroke(minutesColor);
  float minute = minute() + second()/60.0;
  arc(width/2, height/2, (width/8)*3, (width/8)*3, radians(-90), radians(-90+(6*minute) ) );   

  // SECONDS
  stroke(secondsColor);
  arc(width/2, height/2, (width/8)*4, (width/8)*4, radians(-90), radians(-90+(6*second()))); 
    
}

void gridLines() {
  
  stroke(255, 255, 255, 0.3*255);
  strokeWeight(1);
  noFill();
 
  for (int i=0; i<60; i++) {
    arc(width/2, height/2, 10000, 10000, radians(6*i), radians((6*i)+6), PIE);
  }
 
  noStroke();
  fill(0);
  ellipse(width/2, height/2, ((width/8)*3)+45, ((width/8)*3)+45);
 
  stroke(255, 255, 255, 0.3*255);
  strokeWeight(1);
  noFill();
  for (int i=0; i<24; i++) {
    arc(width/2, height/2, ((width/8)*3)+45, ((width/8)*3)+45, radians(15*i), radians((15*i)+15), PIE);
  }
 
}

float setSunrise() {
  
  String raw = weather.getSunrise();
  float hour = float(split(raw, ":")[0]);
  float minute = float(split(split(raw, ":")[1], " ")[0]);
  return hour + (minute/60);

}

float setSunset() {

  String raw = weather.getSunset();
  float hour = float(split(raw, ":")[0]);
  float minute = float(split(split(raw, ":")[1], " ")[0]);
  return hour+12 + (minute/60);

}

void setTheme1() {
  daylightColor = color(255, 152, 0, 0.7*255);
  hoursColor = color(38, 50, 72);
  minutesColor = color(126, 138, 162);
  secondsColor = color(255, 255, 255);
}

void setTheme2() {
  daylightColor = color(242, 239, 223, 0.7*255);
  hoursColor = color(65, 54, 89);
  minutesColor = color(101, 111, 140);
  secondsColor = color(155, 191, 171);
}

void setTheme3() {
  daylightColor = color(255, 153, 0, 0.7*255);
  hoursColor = color(153, 153, 255);
  minutesColor = color(204, 102, 102);
  secondsColor = color(255, 204, 153);
}

void setTheme4() {
  daylightColor = color(208, 168, 37, 0.7*255);
  hoursColor = color(64, 68, 124);
  minutesColor = color(38, 57, 61);
  secondsColor = color(255, 250, 228);
}
