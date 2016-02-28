
void InitMain() {
  ANSEL  = 0;                         // Configure AN pins as digital
  ANSELH = 0;

  PORTA = 255;
  TRISA = 255;                        // configure PORTA pins as input
  PORTB = 0;                          // set PORTB to 0
  TRISB = 0;                          // designate PORTB pins as output
  PORTC = 0;                          // set PORTC to 0
  TRISC = 0;                          // designate PORTC pins as output

  C1ON_bit = 0;                       // Disable comparators
  C2ON_bit = 0;
  PWM1_Init(500);
}

void servir(unsigned short tamanio) {

  PWM1_Start();                       // start PWM1
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