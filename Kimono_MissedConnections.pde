//create json object, which will store the json file
JSONObject json;
String myURL = "https://www.kimonolabs.com/api/8zoxmwbu?apikey=Iu1CLKRXSjXL2TStKR7eap5chY0qVfux";
String todaysDate = "Feb 5";
int count = 0;
int time=0;


// ********************** Arduino Setup *************************
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };


void setup(){
json = loadJSONObject(myURL);
arduino = new Arduino(this, Arduino.list()[0], 57600);
  // Set the Arduino digital pins as outputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
}

void draw(){

loaddata();
arduino.analogWrite(3, constrain(count, 0, 255));
}

void loaddata(){
  count=0;
JSONObject results = json.getJSONObject("results");
JSONArray collection = results.getJSONArray("collection1");

int sizeOfCollection = collection.size();
println(sizeOfCollection);

for (int i = 0; i<sizeOfCollection; i++)
{
  JSONObject post = collection.getJSONObject(i);
  //JSONObject title = post.getJSONObject("Title");
  //String link = title.getString("href");
  String date = post.getString("Date");
  if (date.equals(todaysDate)){
  count=count+1;
  }
}
println(count);
}
