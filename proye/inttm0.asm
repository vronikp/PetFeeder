
_alimentar:

;inttm0.c,5 :: 		void alimentar(unsigned short tamanio) {
;inttm0.c,6 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;inttm0.c,7 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;inttm0.c,8 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_alimentar0:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar0
	DECFSZ     R12+0, 1
	GOTO       L_alimentar0
	DECFSZ     R11+0, 1
	GOTO       L_alimentar0
	NOP
	NOP
;inttm0.c,9 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;inttm0.c,10 :: 		if (tamanio == 'A'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar1
;inttm0.c,11 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_alimentar2:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar2
	DECFSZ     R12+0, 1
	GOTO       L_alimentar2
	DECFSZ     R11+0, 1
	GOTO       L_alimentar2
	NOP
	NOP
;inttm0.c,12 :: 		}
	GOTO       L_alimentar3
L_alimentar1:
;inttm0.c,13 :: 		else if (tamanio == 'B'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar4
;inttm0.c,14 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_alimentar5:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar5
	DECFSZ     R12+0, 1
	GOTO       L_alimentar5
	DECFSZ     R11+0, 1
	GOTO       L_alimentar5
	NOP
	NOP
;inttm0.c,15 :: 		}
	GOTO       L_alimentar6
L_alimentar4:
;inttm0.c,16 :: 		else if (tamanio == 'C'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar7
;inttm0.c,17 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_alimentar8:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar8
	DECFSZ     R12+0, 1
	GOTO       L_alimentar8
	DECFSZ     R11+0, 1
	GOTO       L_alimentar8
	NOP
;inttm0.c,18 :: 		}
	GOTO       L_alimentar9
L_alimentar7:
;inttm0.c,19 :: 		else if (tamanio == 'D'){
	MOVF       FARG_alimentar_tamanio+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L_alimentar10
;inttm0.c,20 :: 		Delay_ms(2500);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_alimentar11:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar11
	DECFSZ     R12+0, 1
	GOTO       L_alimentar11
	DECFSZ     R11+0, 1
	GOTO       L_alimentar11
	NOP
;inttm0.c,21 :: 		}
L_alimentar10:
L_alimentar9:
L_alimentar6:
L_alimentar3:
;inttm0.c,22 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;inttm0.c,23 :: 		PWM1_Set_Duty(30);
	MOVLW      30
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;inttm0.c,24 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_alimentar12:
	DECFSZ     R13+0, 1
	GOTO       L_alimentar12
	DECFSZ     R12+0, 1
	GOTO       L_alimentar12
	DECFSZ     R11+0, 1
	GOTO       L_alimentar12
	NOP
	NOP
;inttm0.c,25 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;inttm0.c,26 :: 		}
L_end_alimentar:
	RETURN
; end of _alimentar

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;inttm0.c,28 :: 		void interrupt() {
;inttm0.c,29 :: 		if (INTCON.TMR0IF) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt13
;inttm0.c,30 :: 		counter++;
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;inttm0.c,31 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;inttm0.c,32 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;inttm0.c,33 :: 		if (counter = 1000) {
	MOVLW      232
	MOVWF      _counter+0
	MOVLW      3
	MOVWF      _counter+1
;inttm0.c,34 :: 		counter =0;
	CLRF       _counter+0
	CLRF       _counter+1
;inttm0.c,35 :: 		segundos++;
	INCF       _segundos+0, 1
;inttm0.c,36 :: 		if (segundos = 60) {
	MOVLW      60
	MOVWF      _segundos+0
;inttm0.c,37 :: 		segundos = 0;
	CLRF       _segundos+0
;inttm0.c,38 :: 		minutos++;
	INCF       _minutos+0, 1
;inttm0.c,39 :: 		if (minutos = 60) {
	MOVLW      60
	MOVWF      _minutos+0
;inttm0.c,40 :: 		minutos = 0;
	CLRF       _minutos+0
;inttm0.c,41 :: 		horas++;
	INCF       _horas+0, 1
;inttm0.c,45 :: 		if (segundos==EEPROM_Read(0x02) && minutos==EEPROM_Read(0x03) && horas==EEPROM_Read(0x04)) {
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       _segundos+0, 0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt19
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       _minutos+0, 0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt19
	MOVLW      4
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       _horas+0, 0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt19
L__interrupt22:
;inttm0.c,46 :: 		alimentar(EEPROM_Read(0x01));
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      FARG_alimentar_tamanio+0
	CALL       _alimentar+0
;inttm0.c,47 :: 		}
L_interrupt19:
;inttm0.c,48 :: 		}
L_interrupt13:
;inttm0.c,50 :: 		}
L_end_interrupt:
L__interrupt25:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;inttm0.c,53 :: 		void main() {
;inttm0.c,54 :: 		OPTION_REG = 0x83;             // Set timer TMR0
	MOVLW      131
	MOVWF      OPTION_REG+0
;inttm0.c,55 :: 		TMR0 = 131;
	MOVLW      131
	MOVWF      TMR0+0
;inttm0.c,56 :: 		INTCON = 0xA0;                 // Disable interrupt PEIE,INTE,RBIE,T0IE
	MOVLW      160
	MOVWF      INTCON+0
;inttm0.c,57 :: 		PORTA = 0;                     // Turn off both displays
	CLRF       PORTA+0
;inttm0.c,58 :: 		TRISA = 0;                     // All port A pins are configured as outputs
	CLRF       TRISA+0
;inttm0.c,59 :: 		PORTC = 0;                     // Turn off all display segments
	CLRF       PORTC+0
;inttm0.c,60 :: 		TRISC = 0;                     // All port D pins are configured as outputs
	CLRF       TRISC+0
;inttm0.c,61 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, 7
;inttm0.c,62 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, 7
;inttm0.c,63 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;inttm0.c,64 :: 		counter = 0;
	CLRF       _counter+0
	CLRF       _counter+1
;inttm0.c,65 :: 		segundos = 0;
	CLRF       _segundos+0
;inttm0.c,66 :: 		minutos = 0;
	CLRF       _minutos+0
;inttm0.c,67 :: 		horas = 0;
	CLRF       _horas+0
;inttm0.c,70 :: 		while (1) {
L_main20:
;inttm0.c,72 :: 		}
	GOTO       L_main20
;inttm0.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
