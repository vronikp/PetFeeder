void alimentar(unsigned short tamanio);
unsigned short qtama (unsigned short kp);
unsigned short teclado (unsigned short kp);
void delay();
 

unsigned short qtama () {
  unsigned short kp;
  qtama:
  
    do {
      kp = Keypad_Key_Click();
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth1;
         }
    }while (!kp);
    kp = teclado(kp);
   
    bluetooth1:
    if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
      Lcd_chr(2, 4, kp);
      do {
        kp = Keypad_Key_Click();             // Store key code in kp variable
        if (UART1_Data_Ready()){
          kp = UART1_Read();
          goto    bluetooth2;
        }
      }while (!kp);
      kp = teclado(kp);
      
      bluetooth2:
      if(kp == '#'){
        goto qtama;
      }
      if(kp == '*'){
        Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
      }
   }else {
     goto qtama;
   }
   return (kp);
 }

void alimentar(unsigned short tama) {
  PWM1_Set_Duty(70);
  PWM1_Start();                       // start PWM1
  Delay_ms(1000);
  PWM1_Stop();
  if (tama = 65){
     Delay_ms(100);
   }
  else if (tama = 66){
     Delay_ms(150);
   }
  else if (tama = 67){
     Delay_ms(200);
   }
  else if (tama = 68){
     Delay_ms(250);
   }
  PWM1_Set_Duty(50);
  PWM1_Start();
  Delay_ms(1000);
  PWM1_Stop();
}

unsigned short obtenerNumero (unsigned short numeroMax) {
  unsigned short dig,numero,kp;
  volverObtenerNumero:
  dig = 0;
  numero=0;
  Lcd_chr(2, 5, ' '); Lcd_chr(2, 4, ' '); Lcd_chr(2, 3, ' '); Lcd_chr(2, 2, ' '); Lcd_chr(2, 1, ' ');
  
  leerNumero:
  do {
    kp = Keypad_Key_Click();             // Store key code in kp variable
    if (UART1_Data_Ready()){
      kp = UART1_Read();
      goto    bluetooth4;
    }
  }while (!kp);
  kp = teclado(kp);
  
  bluetooth4:
  if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'){
    goto leerNumero;
  }else if (kp>=48 && kp<=57) {
    dig++;
    Lcd_chr_Cp(kp);
    numero = (kp-48)+(10*numero);
  }
  
  if(kp == '#'){
    goto volverObtenerNumero;
  }else if (kp == '*' ){
    Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
    delay();
  }else if (numero >= numeroMax){
    //Lcd_Cmd(_LCD_CLEAR);
    Lcd_chr(2, 1,'M'); Lcd_chr(2, 2,'a'); Lcd_chr(2, 3,'x'); Lcd_chr(2, 5,'t');
    delay();
    delay();
    goto volverObtenerNumero;
  }else{
      goto leerNumero;
   }

   return (numero);
}

unsigned short teclado (unsigned short kp) {
    switch (kp) {
      case  1: return 49; break; // 1
      case  2: return 50; break; // 2
      case  3: return 51; break; // 3
      case  4: return 65; break; // A
      case  5: return 52; break; // 4
      case  6: return 53; break; // 5
      case  7: return 54; break; // 6
      case  8: return 66; break; // B
      case  9: return 55; break; // 7
      case 10: return 56; break; // 8
      case 11: return 57; break; // 9
      case 12: return 67; break; // C
      case 13: return 42; break; // *
      case 14: return 48; break; // 0
      case 15: return 35; break; // #
      case 16: return 68; break; // D
    }
}

void delay(){
 delay_ms(500);
}