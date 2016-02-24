
_qtama:

;servir.c,12 :: 		unsigned short qtama () {
;servir.c,14 :: 		qtama:
___qtama_qtama:
;servir.c,16 :: 		do {
L_qtama0:
;servir.c,17 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,18 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama3
;servir.c,19 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,20 :: 		goto    bluetooth1;
	GOTO       ___qtama_bluetooth1
;servir.c,21 :: 		}
L_qtama3:
;servir.c,22 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama0
;servir.c,23 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,25 :: 		bluetooth1:
___qtama_bluetooth1:
;servir.c,27 :: 		if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__qtama78
	MOVF       qtama_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__qtama78
	MOVF       qtama_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__qtama78
	MOVF       qtama_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__qtama78
	GOTO       L_qtama6
L__qtama78:
;servir.c,28 :: 		Lcd_chr(2, 5, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,30 :: 		do {
L_qtama7:
;servir.c,31 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,32 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama10
;servir.c,33 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,34 :: 		goto    bluetooth2;
	GOTO       ___qtama_bluetooth2
;servir.c,35 :: 		}
L_qtama10:
;servir.c,36 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama7
;servir.c,38 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,39 :: 		bluetooth2:
___qtama_bluetooth2:
;servir.c,41 :: 		if(kp == '#'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_qtama11
;servir.c,42 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,43 :: 		}
L_qtama11:
;servir.c,44 :: 		}
	GOTO       L_qtama12
L_qtama6:
;servir.c,46 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,47 :: 		}
L_qtama12:
;servir.c,48 :: 		return (kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      R0+0
;servir.c,49 :: 		}
L_end_qtama:
	RETURN
; end of _qtama

_alimentar:

;servir.c,58 :: 		void alimentar(unsigned short tama) {
;servir.c,59 :: 		PWM1_Set_Duty(70);
	MOVLW      70
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,60 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;servir.c,61 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_alimentar13:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar13
	DECFSZ     R12+0, 1
	GOTO       L_alimentar13
	DECFSZ     R11+0, 1
	GOTO       L_alimentar13
	NOP
	NOP
;servir.c,62 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,63 :: 		if (tama = 65){
	MOVLW      65
	MOVWF      FARG_alimentar_tama+0
;servir.c,64 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_alimentar15:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar15
	DECFSZ     R12+0, 1
	GOTO       L_alimentar15
	DECFSZ     R11+0, 1
	GOTO       L_alimentar15
	NOP
;servir.c,65 :: 		}
	GOTO       L_alimentar16
;servir.c,67 :: 		Delay_ms(150);
L_alimentar18:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar18
	DECFSZ     R12+0, 1
	GOTO       L_alimentar18
	DECFSZ     R11+0, 1
	GOTO       L_alimentar18
;servir.c,68 :: 		}
	GOTO       L_alimentar19
;servir.c,70 :: 		Delay_ms(200);
L_alimentar21:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar21
	DECFSZ     R12+0, 1
	GOTO       L_alimentar21
	DECFSZ     R11+0, 1
	GOTO       L_alimentar21
;servir.c,71 :: 		}
	GOTO       L_alimentar22
;servir.c,73 :: 		Delay_ms(250);
L_alimentar24:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar24
	DECFSZ     R12+0, 1
	GOTO       L_alimentar24
	DECFSZ     R11+0, 1
	GOTO       L_alimentar24
	NOP
	NOP
;servir.c,74 :: 		}
L_alimentar22:
L_alimentar19:
L_alimentar16:
;servir.c,75 :: 		PWM1_Set_Duty(50);
	MOVLW      50
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,76 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;servir.c,77 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_alimentar25:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar25
	DECFSZ     R12+0, 1
	GOTO       L_alimentar25
	DECFSZ     R11+0, 1
	GOTO       L_alimentar25
	NOP
	NOP
;servir.c,78 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,79 :: 		}
L_end_alimentar:
	RETURN
; end of _alimentar

_obtenerNumero:

;servir.c,81 :: 		unsigned short obtenerNumero (unsigned short numMax) {
;servir.c,83 :: 		volverObtenerNumero:
___obtenerNumero_volverObtenerNumero:
;servir.c,85 :: 		numero=0;
	CLRF       obtenerNumero_numero_L0+0
;servir.c,86 :: 		kp=0;
	CLRF       obtenerNumero_kp_L0+0
;servir.c,89 :: 		leerNum:
___obtenerNumero_leerNum:
;servir.c,90 :: 		do {
L_obtenerNumero26:
;servir.c,91 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,92 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero29
;servir.c,93 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,94 :: 		goto    bluetoothRead;
	GOTO       ___obtenerNumero_bluetoothRead
;servir.c,95 :: 		}
L_obtenerNumero29:
;servir.c,96 :: 		}while (!kp);
	MOVF       obtenerNumero_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero26
;servir.c,98 :: 		kp = teclado(kp);
	MOVF       obtenerNumero_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,100 :: 		bluetoothRead:
___obtenerNumero_bluetoothRead:
;servir.c,101 :: 		if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'){
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero81
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero81
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero81
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero81
	GOTO       L_obtenerNumero32
L__obtenerNumero81:
;servir.c,102 :: 		goto leerNum;
	GOTO       ___obtenerNumero_leerNum
;servir.c,103 :: 		}else if (kp != '#' && kp != '*'){
L_obtenerNumero32:
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      35
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero36
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero36
L__obtenerNumero80:
;servir.c,105 :: 		numero =  numero*10  +  kp -48;
	MOVF       obtenerNumero_numero_L0+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       obtenerNumero_kp_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      obtenerNumero_numero_L0+0
	MOVLW      48
	SUBWF      obtenerNumero_numero_L0+0, 1
;servir.c,107 :: 		}
L_obtenerNumero36:
;servir.c,111 :: 		if(kp == '#'){               //si presiona numeral se borra el numero
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_obtenerNumero37
;servir.c,112 :: 		goto volverObtenerNumero;
	GOTO       ___obtenerNumero_volverObtenerNumero
;servir.c,113 :: 		}else if (kp == '*' && numero > 0){
L_obtenerNumero37:
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_obtenerNumero41
	MOVF       obtenerNumero_numero_L0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_obtenerNumero41
L__obtenerNumero79:
;servir.c,115 :: 		Lcd_Out(2, 1, "Valor guardado");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;servir.c,116 :: 		delay();
	CALL       _delay+0
;servir.c,117 :: 		}else if (numero > numMax){
	GOTO       L_obtenerNumero42
L_obtenerNumero41:
	MOVF       obtenerNumero_numero_L0+0, 0
	SUBWF      FARG_obtenerNumero_numMax+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_obtenerNumero43
;servir.c,118 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;servir.c,119 :: 		Lcd_Out(2, 1, "Se paso de valor maximo");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;servir.c,120 :: 		delay();
	CALL       _delay+0
;servir.c,121 :: 		goto volverObtenerNumero;
	GOTO       ___obtenerNumero_volverObtenerNumero
;servir.c,122 :: 		} else{
L_obtenerNumero43:
;servir.c,124 :: 		}
L_obtenerNumero42:
;servir.c,126 :: 		return (numero);
	MOVF       obtenerNumero_numero_L0+0, 0
	MOVWF      R0+0
;servir.c,127 :: 		}
L_end_obtenerNumero:
	RETURN
; end of _obtenerNumero

_teclado:

;servir.c,136 :: 		unsigned short teclado (unsigned short kp) {
;servir.c,137 :: 		switch (kp) {
	GOTO       L_teclado45
;servir.c,138 :: 		case  1: return 49; break; // 1
L_teclado47:
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,139 :: 		case  2: return 50; break; // 2
L_teclado48:
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,140 :: 		case  3: return 51; break; // 3
L_teclado49:
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,141 :: 		case  4: return 65; break; // A
L_teclado50:
	MOVLW      65
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,142 :: 		case  5: return 52; break; // 4
L_teclado51:
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,143 :: 		case  6: return 53; break; // 5
L_teclado52:
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,144 :: 		case  7: return 54; break; // 6
L_teclado53:
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,145 :: 		case  8: return 66; break; // B
L_teclado54:
	MOVLW      66
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,146 :: 		case  9: return 55; break; // 7
L_teclado55:
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,147 :: 		case 10: return 56; break; // 8
L_teclado56:
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,148 :: 		case 11: return 57; break; // 9
L_teclado57:
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,149 :: 		case 12: return 67; break; // C
L_teclado58:
	MOVLW      67
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,150 :: 		case 13: return 42; break; // *
L_teclado59:
	MOVLW      42
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,151 :: 		case 14: return 48; break; // 0
L_teclado60:
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,152 :: 		case 15: return 35; break; // #
L_teclado61:
	MOVLW      35
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,153 :: 		case 16: return 68; break; // D
L_teclado62:
	MOVLW      68
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,154 :: 		}
L_teclado45:
	MOVF       FARG_teclado_kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_teclado47
	MOVF       FARG_teclado_kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_teclado48
	MOVF       FARG_teclado_kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_teclado49
	MOVF       FARG_teclado_kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_teclado50
	MOVF       FARG_teclado_kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_teclado51
	MOVF       FARG_teclado_kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_teclado52
	MOVF       FARG_teclado_kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_teclado53
	MOVF       FARG_teclado_kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_teclado54
	MOVF       FARG_teclado_kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_teclado55
	MOVF       FARG_teclado_kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_teclado56
	MOVF       FARG_teclado_kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_teclado57
	MOVF       FARG_teclado_kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_teclado58
	MOVF       FARG_teclado_kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_teclado59
	MOVF       FARG_teclado_kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_teclado60
	MOVF       FARG_teclado_kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_teclado61
	MOVF       FARG_teclado_kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_teclado62
;servir.c,155 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_delay:

;servir.c,157 :: 		void delay(){
;servir.c,158 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_delay63:
	DECFSZ     R13+0, 1
	GOTO       L_delay63
	DECFSZ     R12+0, 1
	GOTO       L_delay63
	DECFSZ     R11+0, 1
	GOTO       L_delay63
	NOP
	NOP
;servir.c,159 :: 		}
L_end_delay:
	RETURN
; end of _delay

_main:

;pru blue.c,31 :: 		void main() {
;pru blue.c,33 :: 		tama = EEPROM_read(0x01);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _tama+0
;pru blue.c,34 :: 		hora = EEPROM_read(0x02);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _hora+0
;pru blue.c,35 :: 		minuto = EEPROM_read(0x03);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _minuto+0
;pru blue.c,36 :: 		seg = EEPROM_read(0x04);
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _seg+0
;pru blue.c,38 :: 		OPTION_REG = 0x83;             // Set timer TMR0
	MOVLW      131
	MOVWF      OPTION_REG+0
;pru blue.c,39 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;pru blue.c,40 :: 		INTCON = 0xA0;                 // Disable interrupt PEIE,INTE,RBIE,T0IE
	MOVLW      160
	MOVWF      INTCON+0
;pru blue.c,41 :: 		PORTA = 0;                     // Turn off both displays
	CLRF       PORTA+0
;pru blue.c,42 :: 		TRISA = 0;                     // All port A pins are configured as outputs
	CLRF       TRISA+0
;pru blue.c,43 :: 		PORTb = 0;                     // Turn off both displays
	CLRF       PORTB+0
;pru blue.c,44 :: 		TRISb = 0;
	CLRF       TRISB+0
;pru blue.c,45 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, 7
;pru blue.c,46 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, 7
;pru blue.c,47 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pru blue.c,48 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;pru blue.c,49 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;pru blue.c,50 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;pru blue.c,51 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;pru blue.c,52 :: 		Lcd_Init();                              // Initialize Lcd
	CALL       _Lcd_Init+0
;pru blue.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);                      // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,55 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,56 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,57 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,58 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,59 :: 		kp = 0;
	CLRF       _kp+0
;pru blue.c,63 :: 		do{
L_main64:
;pru blue.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,65 :: 		Lcd_Out(1, 1, "Hola ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,66 :: 		Lcd_Out(2, 1, "Pres una tecla");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,67 :: 		do {
L_main67:
;pru blue.c,68 :: 		kp =Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;pru blue.c,69 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main70
;pru blue.c,70 :: 		kp = 1;
	MOVLW      1
	MOVWF      _kp+0
;pru blue.c,71 :: 		}
L_main70:
;pru blue.c,72 :: 		}while (!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main67
;pru blue.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,75 :: 		Lcd_Out(1, 1, "Elija tamaño");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,76 :: 		delay();
	CALL       _delay+0
;pru blue.c,77 :: 		tama = qtama ();
	CALL       _qtama+0
	MOVF       R0+0, 0
	MOVWF      _tama+0
;pru blue.c,79 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,80 :: 		Lcd_Out(1, 1, "Cada cuanto");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,81 :: 		Lcd_Out(2, 1, "alimentar mascot");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,82 :: 		delay();
	CALL       _delay+0
;pru blue.c,83 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,84 :: 		Lcd_Out(1, 1, "Numero de horas");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,85 :: 		hora = obtenerNumero (24);
	MOVLW      24
	MOVWF      FARG_obtenerNumero_numMax+0
	CALL       _obtenerNumero+0
	MOVF       R0+0, 0
	MOVWF      _hora+0
;pru blue.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,87 :: 		Lcd_Out(1, 1, " # de minutos");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,88 :: 		minuto = obtenerNumero (60);
	MOVLW      60
	MOVWF      FARG_obtenerNumero_numMax+0
	CALL       _obtenerNumero+0
	MOVF       R0+0, 0
	MOVWF      _minuto+0
;pru blue.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,90 :: 		Lcd_Out(1, 1, "# de segundos");                 // Write message text on Lcd
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,91 :: 		seg = obtenerNumero (60);
	MOVLW      60
	MOVWF      FARG_obtenerNumero_numMax+0
	CALL       _obtenerNumero+0
	MOVF       R0+0, 0
	MOVWF      _seg+0
;pru blue.c,93 :: 		EEPROM_Write(0x01,tama);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _tama+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,94 :: 		EEPROM_Write(0x02,hora);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _hora+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,95 :: 		EEPROM_Write(0x03,minuto);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _minuto+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,96 :: 		EEPROM_Write(0x04,seg);
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _seg+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;pru blue.c,97 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,98 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,99 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,100 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,101 :: 		}while (1);
	GOTO       L_main64
;pru blue.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;pru blue.c,104 :: 		void interrupt() {
;pru blue.c,105 :: 		if (INTCON.TMR0IF) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt71
;pru blue.c,106 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;pru blue.c,107 :: 		if (counter == 1000) {
	MOVF       _counter+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt91
	MOVLW      232
	XORWF      _counter+0, 0
L__interrupt91:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt72
;pru blue.c,108 :: 		counter =0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,109 :: 		segundos++;
	INCF       _segundos+0, 1
;pru blue.c,110 :: 		portb++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;pru blue.c,111 :: 		if (segundos == 60) {
	MOVF       _segundos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt73
;pru blue.c,112 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,113 :: 		minutos++;
	INCF       _minutos+0, 1
;pru blue.c,114 :: 		if (minutos == 60) {
	MOVF       _minutos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt74
;pru blue.c,115 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,116 :: 		horas++;
	INCF       _horas+0, 1
;pru blue.c,117 :: 		}
L_interrupt74:
;pru blue.c,118 :: 		}
L_interrupt73:
;pru blue.c,119 :: 		}
L_interrupt72:
;pru blue.c,120 :: 		if (segundos==seg && minutos==minuto && horas==hora) {
	MOVF       _segundos+0, 0
	XORWF      _seg+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt77
	MOVF       _minutos+0, 0
	XORWF      _minuto+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt77
	MOVF       _horas+0, 0
	XORWF      _hora+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt77
L__interrupt82:
;pru blue.c,121 :: 		alimentar(tama);
	MOVF       _tama+0, 0
	MOVWF      FARG_alimentar_tama+0
	CALL       _alimentar+0
;pru blue.c,122 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;pru blue.c,123 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,124 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,125 :: 		horas = 0;
	CLRF       _horas+0
;pru blue.c,126 :: 		}
L_interrupt77:
;pru blue.c,127 :: 		}
L_interrupt71:
;pru blue.c,128 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;pru blue.c,129 :: 		TMR0 = 130;
	MOVLW      130
	MOVWF      TMR0+0
;pru blue.c,130 :: 		}
L_end_interrupt:
L__interrupt90:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
