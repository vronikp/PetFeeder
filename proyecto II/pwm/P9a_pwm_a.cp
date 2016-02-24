#line 1 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/pwm/P9a_pwm_a.c"
#line 1 "c:/users/javier/google drive/lab. microcon/proyecto ii/pwm/servir.h"

void InitMain() {
 ANSEL = 0;
 ANSELH = 0;

 PORTA = 255;
 TRISA = 255;
 PORTB = 0;
 TRISB = 0;
 PORTC = 0;
 TRISC = 0;

 C1ON_bit = 0;
 C2ON_bit = 0;
 PWM1_Init(500);
}

void servir(unsigned short tamanio) {

 PWM1_Start();
 PWM1_Set_Duty(255);
 Delay_ms(750);
 PWM1_Stop();
 if (tamanio == 'p'){
 Delay_ms(500);}
 else if (tamanio == 'm'){
 Delay_ms(1500);}
 else if (tamanio == 'g'){
 Delay_ms(2000);}
 else if (tamanio == 'x'){
 Delay_ms(2500);}
 else {Delay_ms(1500);}

 PWM1_Start();
 PWM1_Set_Duty(30);
 Delay_ms(750);
 PWM1_Stop();
}
#line 3 "C:/Users/Javier/Google Drive/lab. microcon/proyecto II/pwm/P9a_pwm_a.c"
void main() {
 InitMain();

 while (1) {
 servir('p');
 }
}
