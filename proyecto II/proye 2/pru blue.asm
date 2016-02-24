
_qtama:

;servir.c,7 :: 		unsigned short qtama () {
;servir.c,9 :: 		qtama:
___qtama_qtama:
;servir.c,11 :: 		do {
L_qtama0:
;servir.c,12 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,13 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama3
;servir.c,14 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,15 :: 		goto    bluetooth1;
	GOTO       ___qtama_bluetooth1
;servir.c,16 :: 		}
L_qtama3:
;servir.c,17 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama0
;servir.c,18 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,20 :: 		bluetooth1:
___qtama_bluetooth1:
;servir.c,21 :: 		if(kp == 'A' ||kp== 'B' ||kp== 'C'||kp== 'D'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__qtama77
	MOVF       qtama_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__qtama77
	MOVF       qtama_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__qtama77
	MOVF       qtama_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__qtama77
	GOTO       L_qtama6
L__qtama77:
;servir.c,22 :: 		Lcd_chr(2, 4, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,23 :: 		do {
L_qtama7:
;servir.c,24 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,25 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama10
;servir.c,26 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,27 :: 		goto    bluetooth2;
	GOTO       ___qtama_bluetooth2
;servir.c,28 :: 		}
L_qtama10:
;servir.c,29 :: 		}while (!kp);
	MOVF       qtama_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_qtama7
;servir.c,30 :: 		kp = teclado(kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      qtama_kp_L0+0
;servir.c,32 :: 		bluetooth2:
___qtama_bluetooth2:
;servir.c,33 :: 		if(kp == '#'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_qtama11
;servir.c,34 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,35 :: 		}
L_qtama11:
;servir.c,36 :: 		if(kp == '*'){
	MOVF       qtama_kp_L0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_qtama12
;servir.c,37 :: 		Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      71
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      117
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      114
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      100
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      100
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      111
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,38 :: 		}
L_qtama12:
;servir.c,39 :: 		}else {
	GOTO       L_qtama13
L_qtama6:
;servir.c,40 :: 		goto qtama;
	GOTO       ___qtama_qtama
;servir.c,41 :: 		}
L_qtama13:
;servir.c,42 :: 		return (kp);
	MOVF       qtama_kp_L0+0, 0
	MOVWF      R0+0
;servir.c,43 :: 		}
L_end_qtama:
	RETURN
; end of _qtama

_alimentar:

;servir.c,45 :: 		void alimentar(unsigned short tama) {
;servir.c,46 :: 		PWM1_Set_Duty(70);
	MOVLW      70
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,47 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;servir.c,48 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_alimentar14:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar14
	DECFSZ     R12+0, 1
	GOTO       L_alimentar14
	DECFSZ     R11+0, 1
	GOTO       L_alimentar14
	NOP
	NOP
;servir.c,49 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,50 :: 		if (tama = 65){
	MOVLW      65
	MOVWF      FARG_alimentar_tama+0
;servir.c,51 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_alimentar16:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar16
	DECFSZ     R12+0, 1
	GOTO       L_alimentar16
	DECFSZ     R11+0, 1
	GOTO       L_alimentar16
	NOP
;servir.c,52 :: 		}
	GOTO       L_alimentar17
;servir.c,54 :: 		Delay_ms(150);
L_alimentar19:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar19
	DECFSZ     R12+0, 1
	GOTO       L_alimentar19
	DECFSZ     R11+0, 1
	GOTO       L_alimentar19
;servir.c,55 :: 		}
	GOTO       L_alimentar20
;servir.c,57 :: 		Delay_ms(200);
L_alimentar22:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar22
	DECFSZ     R12+0, 1
	GOTO       L_alimentar22
	DECFSZ     R11+0, 1
	GOTO       L_alimentar22
;servir.c,58 :: 		}
	GOTO       L_alimentar23
;servir.c,60 :: 		Delay_ms(250);
L_alimentar25:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar25
	DECFSZ     R12+0, 1
	GOTO       L_alimentar25
	DECFSZ     R11+0, 1
	GOTO       L_alimentar25
	NOP
	NOP
;servir.c,61 :: 		}
L_alimentar23:
L_alimentar20:
L_alimentar17:
;servir.c,62 :: 		PWM1_Set_Duty(50);
	MOVLW      50
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.c,63 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;servir.c,64 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_alimentar26:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar26
	DECFSZ     R12+0, 1
	GOTO       L_alimentar26
	DECFSZ     R11+0, 1
	GOTO       L_alimentar26
	NOP
	NOP
;servir.c,65 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.c,66 :: 		}
L_end_alimentar:
	RETURN
; end of _alimentar

_obtenerNumero:

;servir.c,68 :: 		unsigned short obtenerNumero (unsigned short numeroMax) {
;servir.c,70 :: 		volverObtenerNumero:
___obtenerNumero_volverObtenerNumero:
;servir.c,72 :: 		numero=0;
	CLRF       obtenerNumero_numero_L0+0
;servir.c,73 :: 		Lcd_chr(2, 5, ' '); Lcd_chr(2, 4, ' '); Lcd_chr(2, 3, ' '); Lcd_chr(2, 2, ' '); Lcd_chr(2, 1, ' ');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,75 :: 		leerNumero:
___obtenerNumero_leerNumero:
;servir.c,76 :: 		do {
L_obtenerNumero27:
;servir.c,77 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,78 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero30
;servir.c,79 :: 		kp = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,80 :: 		goto    bluetooth4;
	GOTO       ___obtenerNumero_bluetooth4
;servir.c,81 :: 		}
L_obtenerNumero30:
;servir.c,82 :: 		}while (!kp);
	MOVF       obtenerNumero_kp_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_obtenerNumero27
;servir.c,83 :: 		kp = teclado(kp);
	MOVF       obtenerNumero_kp_L0+0, 0
	MOVWF      FARG_teclado_kp+0
	CALL       _teclado+0
	MOVF       R0+0, 0
	MOVWF      obtenerNumero_kp_L0+0
;servir.c,85 :: 		bluetooth4:
___obtenerNumero_bluetooth4:
;servir.c,86 :: 		if(kp == 'A' || kp== 'B' || kp == 'C' ||kp == 'D'){
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero79
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero79
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero79
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L__obtenerNumero79
	GOTO       L_obtenerNumero33
L__obtenerNumero79:
;servir.c,87 :: 		goto leerNumero;
	GOTO       ___obtenerNumero_leerNumero
;servir.c,88 :: 		}else if (kp>=48 && kp<=57) {
L_obtenerNumero33:
	MOVLW      48
	SUBWF      obtenerNumero_kp_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_obtenerNumero37
	MOVF       obtenerNumero_kp_L0+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_obtenerNumero37
L__obtenerNumero78:
;servir.c,90 :: 		Lcd_chr_Cp(kp);
	MOVF       obtenerNumero_kp_L0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;servir.c,91 :: 		numero = (kp-48)+(10*numero);
	MOVLW      48
	SUBWF      obtenerNumero_kp_L0+0, 0
	MOVWF      FLOC__obtenerNumero+0
	MOVLW      10
	MOVWF      R0+0
	MOVF       obtenerNumero_numero_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	ADDWF      FLOC__obtenerNumero+0, 0
	MOVWF      obtenerNumero_numero_L0+0
;servir.c,92 :: 		}
L_obtenerNumero37:
;servir.c,94 :: 		if(kp == '#'){
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_obtenerNumero38
;servir.c,95 :: 		goto volverObtenerNumero;
	GOTO       ___obtenerNumero_volverObtenerNumero
;servir.c,96 :: 		}else if (kp == '*' ){
L_obtenerNumero38:
	MOVF       obtenerNumero_kp_L0+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_obtenerNumero40
;servir.c,97 :: 		Lcd_Chr (2,6,'G'); Lcd_Chr (2,7,'u'); Lcd_Chr (2,8,'a'); Lcd_Chr (2,9,'r');Lcd_Chr (2,10,'d');Lcd_Chr (2,11,'a'); Lcd_Chr (2,12,'d'); Lcd_Chr (2,13,'o');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      71
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      117
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      114
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      100
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      100
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      111
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,98 :: 		delay();
	CALL       _delay+0
;servir.c,99 :: 		}else if (numero >= numeroMax){
	GOTO       L_obtenerNumero41
L_obtenerNumero40:
	MOVF       FARG_obtenerNumero_numeroMax+0, 0
	SUBWF      obtenerNumero_numero_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_obtenerNumero42
;servir.c,101 :: 		Lcd_chr(2, 1,'M'); Lcd_chr(2, 2,'a'); Lcd_chr(2, 3,'x'); Lcd_chr(2, 5,'t');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      77
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      97
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      120
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      116
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;servir.c,102 :: 		delay();
	CALL       _delay+0
;servir.c,103 :: 		delay();
	CALL       _delay+0
;servir.c,104 :: 		goto volverObtenerNumero;
	GOTO       ___obtenerNumero_volverObtenerNumero
;servir.c,105 :: 		}else{
L_obtenerNumero42:
;servir.c,106 :: 		goto leerNumero;
	GOTO       ___obtenerNumero_leerNumero
;servir.c,107 :: 		}
L_obtenerNumero41:
;servir.c,109 :: 		return (numero);
	MOVF       obtenerNumero_numero_L0+0, 0
	MOVWF      R0+0
;servir.c,110 :: 		}
L_end_obtenerNumero:
	RETURN
; end of _obtenerNumero

_teclado:

;servir.c,112 :: 		unsigned short teclado (unsigned short kp) {
;servir.c,113 :: 		switch (kp) {
	GOTO       L_teclado44
;servir.c,114 :: 		case  1: return 49; break; // 1
L_teclado46:
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,115 :: 		case  2: return 50; break; // 2
L_teclado47:
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,116 :: 		case  3: return 51; break; // 3
L_teclado48:
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,117 :: 		case  4: return 65; break; // A
L_teclado49:
	MOVLW      65
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,118 :: 		case  5: return 52; break; // 4
L_teclado50:
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,119 :: 		case  6: return 53; break; // 5
L_teclado51:
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,120 :: 		case  7: return 54; break; // 6
L_teclado52:
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,121 :: 		case  8: return 66; break; // B
L_teclado53:
	MOVLW      66
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,122 :: 		case  9: return 55; break; // 7
L_teclado54:
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,123 :: 		case 10: return 56; break; // 8
L_teclado55:
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,124 :: 		case 11: return 57; break; // 9
L_teclado56:
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,125 :: 		case 12: return 67; break; // C
L_teclado57:
	MOVLW      67
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,126 :: 		case 13: return 42; break; // *
L_teclado58:
	MOVLW      42
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,127 :: 		case 14: return 48; break; // 0
L_teclado59:
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,128 :: 		case 15: return 35; break; // #
L_teclado60:
	MOVLW      35
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,129 :: 		case 16: return 68; break; // D
L_teclado61:
	MOVLW      68
	MOVWF      R0+0
	GOTO       L_end_teclado
;servir.c,130 :: 		}
L_teclado44:
	MOVF       FARG_teclado_kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_teclado46
	MOVF       FARG_teclado_kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_teclado47
	MOVF       FARG_teclado_kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_teclado48
	MOVF       FARG_teclado_kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_teclado49
	MOVF       FARG_teclado_kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_teclado50
	MOVF       FARG_teclado_kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_teclado51
	MOVF       FARG_teclado_kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_teclado52
	MOVF       FARG_teclado_kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_teclado53
	MOVF       FARG_teclado_kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_teclado54
	MOVF       FARG_teclado_kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_teclado55
	MOVF       FARG_teclado_kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_teclado56
	MOVF       FARG_teclado_kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_teclado57
	MOVF       FARG_teclado_kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_teclado58
	MOVF       FARG_teclado_kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_teclado59
	MOVF       FARG_teclado_kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_teclado60
	MOVF       FARG_teclado_kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_teclado61
;servir.c,131 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_delay:

;servir.c,133 :: 		void delay(){
;servir.c,134 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_delay62:
	DECFSZ     R13+0, 1
	GOTO       L_delay62
	DECFSZ     R12+0, 1
	GOTO       L_delay62
	DECFSZ     R11+0, 1
	GOTO       L_delay62
	NOP
	NOP
;servir.c,135 :: 		}
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
L_main63:
;pru blue.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,65 :: 		Lcd_Out(1, 1, "Hola ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,66 :: 		Lcd_Out(2, 1, "Pres una tecla");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,67 :: 		do {
L_main66:
;pru blue.c,68 :: 		kp =Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;pru blue.c,69 :: 		if (UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main69
;pru blue.c,70 :: 		kp = 1;
	MOVLW      1
	MOVWF      _kp+0
;pru blue.c,71 :: 		}
L_main69:
;pru blue.c,72 :: 		}while (!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main66
;pru blue.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pru blue.c,75 :: 		Lcd_Out(1, 1, "Elija tamaño");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_pru_32blue+0
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
	MOVLW      ?lstr4_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,81 :: 		Lcd_Out(2, 1, "alimentar mascot");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_pru_32blue+0
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
	MOVLW      ?lstr6_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,85 :: 		hora = obtenerNumero (24);
	MOVLW      24
	MOVWF      FARG_obtenerNumero_numeroMax+0
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
	MOVLW      ?lstr7_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,88 :: 		minuto = obtenerNumero (60);
	MOVLW      60
	MOVWF      FARG_obtenerNumero_numeroMax+0
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
	MOVLW      ?lstr8_pru_32blue+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pru blue.c,91 :: 		seg = obtenerNumero (60);
	MOVLW      60
	MOVWF      FARG_obtenerNumero_numeroMax+0
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
	GOTO       L_main63
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
	GOTO       L_interrupt70
;pru blue.c,106 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;pru blue.c,107 :: 		if (counter == 1000) {
	MOVF       _counter+1, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt89
	MOVLW      232
	XORWF      _counter+0, 0
L__interrupt89:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt71
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
	GOTO       L_interrupt72
;pru blue.c,112 :: 		segundos = 0;
	CLRF       _segundos+0
;pru blue.c,113 :: 		minutos++;
	INCF       _minutos+0, 1
;pru blue.c,114 :: 		if (minutos == 60) {
	MOVF       _minutos+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt73
;pru blue.c,115 :: 		minutos = 0;
	CLRF       _minutos+0
;pru blue.c,116 :: 		horas++;
	INCF       _horas+0, 1
;pru blue.c,117 :: 		}
L_interrupt73:
;pru blue.c,118 :: 		}
L_interrupt72:
;pru blue.c,119 :: 		}
L_interrupt71:
;pru blue.c,120 :: 		if (segundos==seg && minutos==minuto && horas==hora) {
	MOVF       _segundos+0, 0
	XORWF      _seg+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt76
	MOVF       _minutos+0, 0
	XORWF      _minuto+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt76
	MOVF       _horas+0, 0
	XORWF      _hora+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt76
L__interrupt80:
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
L_interrupt76:
;pru blue.c,127 :: 		}
L_interrupt70:
;pru blue.c,128 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;pru blue.c,129 :: 		TMR0 = 130;
	MOVLW      130
	MOVWF      TMR0+0
;pru blue.c,130 :: 		}
L_end_interrupt:
L__interrupt88:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
