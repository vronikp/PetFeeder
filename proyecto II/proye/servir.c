void alimentar(unsigned short tamanio);
unsigned short qtama (unsigned short kp);
unsigned short teclado (unsigned short kp);
void delay();
 
 /* 
    Nombre: qtama
    Descripcion: establece el tamaño de la porcion de comida servida.
    Parametros: ninguno
    Retorna: entero sin signo
 */
unsigned short qtama () {
 unsigned short kp;
  qtama:

   do {
      kp = Keypad_Key_Click();             // Store key code in kp variable
      if (UART1_Data_Ready()){
         kp = UART1_Read();
         goto    bluetooth1;
         }
      }while (!kp);
    kp = teclado(kp);
    
    bluetooth1:

    if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
          Lcd_chr(2, 5, kp);

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
   }
  else {
  goto qtama;
  }
  return (kp);
 }


 /*
    Nombre: alimentar
    Descripcion: abre la compuerta para que salga la comida de acuerdo al tamaño enviado.
    Parametros: entero tamaño
    Retorna: nada
 */
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

unsigned short obtenerNumero (unsigned short numMax) {
  unsigned short dig, numero, kp;
  volverObtenerNumero:
  dig = 0;
  numero=0;
  
  leerNum:
  do {
      kp = Keypad_Key_Click();
      if (UART1_Data_Ready()){
        kp = UART1_Read();
        goto    bluetoothRead;
      }
    }while (!kp);
    kp = teclado(kp);
    
    bluetoothRead:
    if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'){
      goto leerNum;
    }else if (kp != '#' && kp != '*'){
      dig++;
      numero =  numero*10  +  kp -48;
      //Lcd_Chr(2, 7+dig, kp);
    }
  
  //}while (numero > numMax && kp != '*'  && kp != '#');
  
  if(kp == '#'){               //si presiona numeral se borra el numero
    goto volverObtenerNumero;
  }else if (kp == '*' && numero > 0){
    //Lcd_Chr(2, 7, (numero+48));
    Lcd_Out(2, 1, "Valor guardado");
    delay();
  }else if (numero > numMax){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(2, 1, "Se paso de valor maximo");
    delay();
    goto volverObtenerNumero;
  } else{
    goto leerNum;
  }

  return (numero);
}


 /*
    Nombre: teclado
    Descripcion: obtiene el valor de la tecla presionada en un keypad de 4 x 4 teclas
    Parametros: tecla presionada (1-12)
    Retorna: codigo ASCII de la tecla presionada
 */
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