#include <TinkerKit.h>
#include <math.h>


#define MAX_C 100


TKLed led_b(O0);
TKLed led_y(O1);
TKPotentiometer pot(I0);
TKThermistor therm(I1);
TKButton btn(I2); 

int limitCelsius = MAX_C;
float celsius = 0;
bool hasLimit = false;


int readPotValue(const TKPotentiometer &pot) {
  return map(pot.read(), 0, 1023, 0, MAX_C);
}

void blinkLed(const TKLed &led, const int cnt, const int delayVal) {
  for (int i = 0; i < cnt; i++) {
    led.on();
    delay(delayVal);
    led.off();
    delay(delayVal);
  }
  led.on();
}

void showWarning() {
  for (int i = 0; i < 10; i++) {
      led_b.on();
      led_y.off();
      delay(100);
      led_b.off();
      led_y.on();
      delay(100);
    }
    led_b.on();
    led_y.on();
}

void setup() {
  Serial.begin(9600);
  led_b.on();
  led_y.on();
}


void loop() {  
  if (btn.pressed()) {
    hasLimit = !hasLimit;
  }

  limitCelsius = hasLimit ? readPotValue(pot) : MAX_C;
  //Serial.print("limitCelsius = ");
  //Serial.println(limitCelsius);


  celsius = therm.readCelsius();  
  //Serial.print("celsius = ");
  //Serial.println(celsius);

  if (celsius < limitCelsius) {
    int a = (int)(celsius / 10);
    int b = (int)celsius % 10;

    blinkLed(led_b, a, 200);
    blinkLed(led_y, b, 200);
  } else {
    showWarning();
  }

  delay(500);
}
