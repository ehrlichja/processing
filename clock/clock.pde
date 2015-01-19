import com.onformative.yahooweather.*;

YahooWeather weather;
int updateIntervallMillis = 60000*60*24; 

float sunrise;
float sunset;

color daylightColor;
color hoursColor;
color minutesColor;
color secondsColor;

int timeStroke=10;

void setup() {
 size(320, 240);
 weather = new YahooWeather(this, 2487956, "c", updateIntervallMillis);
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

void draw() {
  
  setTheme1();
  
  sunrise = setSunrise();
  sunset = setSunset();

  background(0);
  
  gridLines();
  
  // Daylight
  noStroke();
  fill(daylightColor);
  arc(width/2, height/2, (width/8)*3, (width/8)*3, radians(-90+(15*sunrise)), radians(-90+(15*sunset)), PIE);
  
  noFill();
  strokeWeight(timeStroke);
  strokeCap(SQUARE);
  
  // HOURS
  stroke(hoursColor);
  float hour = hour() + minute()/60.0;
  arc(width/2, height/2, (width/8)*3, (width/8)*3, radians(-90), radians(-90+(15*hour)));   

  // MINUTES
  stroke(minutesColor);
  float minute = minute() + second()/60.0;
  arc(width/2, height/2, (width/8)*4, (width/8)*4, radians(-90), radians(-90+(6*minute) ) );   

  // SECONDS
  stroke(secondsColor);
  arc(width/2, height/2, (width/8)*5, (width/8)*5, radians(-90), radians(-90+(6*second()))); 

}

void gridLines() {
 stroke(255, 255, 255, 0.07*255);
 strokeWeight(1);
 noFill();
 
 for (int i=0; i<60; i++) {
   arc(width/2, height/2, 10000, 10000, radians(6*i), radians((6*i)+6), PIE);
 }
 
 noStroke();
 fill(0);
 ellipse(width/2, height/2, ((width/8)*3)+60, ((width/8)*3)+60);
 
 stroke(255, 255, 255, 0.1*255);
 strokeWeight(1);
 noFill();
 for (int i=0; i<24; i++) {
   arc(width/2, height/2, ((width/8)*3)+60, ((width/8)*3)+60, radians(15*i), radians((15*i)+15), PIE);
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
