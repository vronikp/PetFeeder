void alimentar(unsigned short tamanio);
unsigned short qtama (unsigned short kp);
unsigned short teclado (unsigned short kp);
void delay();
 

unsigned short qtama () {
 unsigned short kp;
  qtama:
 /* Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "A ==> Pequeño");                 // Write message text on Lcd
  Lcd_Out(2, 1, "B ==> Mediano");
  delay_ms(1000);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "C ==> Grande");                 // Write message text on Lcd
  Lcd_Out(2, 1, "D ==> X Grande");  */

  /* entradas*/
   do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth1;
         }
      }while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    kp = teclado(kp);
    bluetooth1:

  if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
    Lcd_chr(2, 5, kp);

/* entradas*/
    do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth2;
         }
      }while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    kp = teclado(kp);
    bluetooth2:
    
    if(kp == '#'){
    goto qtama;
    }
   }
  else {
  goto qtama;
  }
  return (kp);
 }

void alimentar(unsigned short tama) {
  PWM1_Set_Duty(240);
  PWM1_Start();                       // start PWM1
  Delay_ms(1000);
  PWM1_Stop();
  if (tama = 65){
     Delay_ms(1000);
   }
  else if (tama = 66){
     Delay_ms(1500);
   }
  else if (tama = 67){
     Delay_ms(2000);
   }
  else if (tama = 68){
     Delay_ms(2500);
   }
  PWM1_Set_Duty(50);
  PWM1_Start();
  Delay_ms(1000);
  PWM1_Stop();
}

unsigned short ccalimentah () {
unsigned short dig,hora,kp;

ccalimentah:
  dig = 0;
  nonumh:

//entrada
    do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth4;
         }
      }while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    kp = teclado(kp);
    bluetooth4:
    Lcd_chr(2, 7,kp);
    delay();

  nnumh:
  if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){

   Lcd_chr(1, 1,'n');  Lcd_chr(1, 2,'o'); Lcd_chr(1, 4,'n'); Lcd_chr(1, 5,'u'); Lcd_chr(1, 6,'m');
   delay();
   goto nonumh;
   }
  else {
   dig++;
   }
   if(dig == 1 && (kp-48) <= 2 ){
    hora = kp-48;
    Lcd_Chr(2, 7, kp);

 // entradas
     do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth;
         }
      }while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    kp = teclado(kp);
    bluetooth:
    Lcd_Chr(2, 7, kp);
    delay();

    if(kp == '#'){
     goto ccalimentah;
    }
    else if (kp == '*'){
    Lcd_Chr(2, 7, (hora+48));
    delay();
    }
    else{
     goto nnumh;
    }
   }
   else if (dig == 2 && (kp-48) <= 4){
   Lcd_chr(2, 7, (hora+48));
   hora = (kp-48)+(10*hora);
   Lcd_chr(2, 8, kp);
   Lcd_chr(2, 10, hora);
   delay();
   }
   else if (dig == 2 && (kp-48) >= 5){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_chr(1, 1,'m');  Lcd_chr(1, 2,'a'); Lcd_chr(1, 3,'x'); Lcd_chr(1, 5,'t');
    delay();
     goto ccalimentah;
   }
   else {
    hora = kp-48;
    Lcd_Chr(2, 7, kp);
    delay();
   }
   return (hora);
}

unsigned short ccalimentam () {
unsigned short dig,minuto,kp;

ccalimentaM:
  dig = 0;
  nonumm:

// entrada
    do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetoothm1;
         }
      }while (!kp);
    kp = teclado(kp);
    bluetoothm1:
    Lcd_chr(2, 7,kp);
    delay();

  nnumm:
  if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'||kp == '#' ||kp == '*'){
   Lcd_chr(1,1,'n'); Lcd_chr(1,2,'o'); Lcd_chr(1,3,'n'); Lcd_chr(1,4,'u'); Lcd_chr(1,5,'m');
   delay();
   goto nonumm;
   }
  else {
   dig++;
   }

   if(dig == 1 && (kp-48) <= 5 && (kp-48) >= 0){
    minuto = kp-48;
    Lcd_Chr(2, 7, kp);

// entrada
    do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetoothm2;
         }
      }while (!kp);
     kp = teclado(kp);
    bluetoothm2:
    Lcd_Chr(2, 7, kp);
    delay();

    if(kp == '#'){
     goto ccalimentam;
    }
    else if (kp == '*'){
    Lcd_Chr(2, 7, (minuto+48));
    delay();
    }
    else{
     goto nnumm;
    }
   }
   else if (dig == 2 && (kp-48) <= 9 && (kp-48) >= 0){
   Lcd_chr(2,7,(minuto+48));
   minuto = (kp-48)+(10*minuto);
   Lcd_chr(2,8,kp);
   Lcd_chr(2,10,minuto);
   delay();
   }
   else {
    minuto = kp-48;
    Lcd_Chr(2, 7, kp);
    delay();
   }
   return(minuto);
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