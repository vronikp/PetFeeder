
_InitMain:

;servir.h,2 :: 		void InitMain() {
;servir.h,3 :: 		ANSEL  = 0;                         // Configure AN pins as digital
	CLRF       ANSEL+0
;servir.h,4 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;servir.h,6 :: 		PORTA = 255;
	MOVLW      255
	MOVWF      PORTA+0
;servir.h,7 :: 		TRISA = 255;                        // configure PORTA pins as input
	MOVLW      255
	MOVWF      TRISA+0
;servir.h,8 :: 		PORTB = 0;                          // set PORTB to 0
	CLRF       PORTB+0
;servir.h,9 :: 		TRISB = 0;                          // designate PORTB pins as output
	CLRF       TRISB+0
;servir.h,10 :: 		PORTC = 0;                          // set PORTC to 0
	CLRF       PORTC+0
;servir.h,11 :: 		TRISC = 0;                          // designate PORTC pins as output
	CLRF       TRISC+0
;servir.h,13 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, 7
;servir.h,14 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, 7
;servir.h,15 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;servir.h,16 :: 		}
L_end_InitMain:
	RETURN
; end of _InitMain

_servir:

;servir.h,18 :: 		void servir(unsigned short tamanio) {
;servir.h,20 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;servir.h,21 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.h,22 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servir0:
	DECFSZ     R13+0, 1
	GOTO       L_servir0
	DECFSZ     R12+0, 1
	GOTO       L_servir0
	DECFSZ     R11+0, 1
	GOTO       L_servir0
	NOP
	NOP
;servir.h,23 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.h,24 :: 		if (tamanio == 'p'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_servir1
;servir.h,25 :: 		Delay_ms(500);}
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_servir2:
	DECFSZ     R13+0, 1
	GOTO       L_servir2
	DECFSZ     R12+0, 1
	GOTO       L_servir2
	DECFSZ     R11+0, 1
	GOTO       L_servir2
	NOP
	NOP
	GOTO       L_servir3
L_servir1:
;servir.h,26 :: 		else if (tamanio == 'm'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L_servir4
;servir.h,27 :: 		Delay_ms(1500);}
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servir5:
	DECFSZ     R13+0, 1
	GOTO       L_servir5
	DECFSZ     R12+0, 1
	GOTO       L_servir5
	DECFSZ     R11+0, 1
	GOTO       L_servir5
	NOP
	NOP
	GOTO       L_servir6
L_servir4:
;servir.h,28 :: 		else if (tamanio == 'g'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L_servir7
;servir.h,29 :: 		Delay_ms(2000);}
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_servir8:
	DECFSZ     R13+0, 1
	GOTO       L_servir8
	DECFSZ     R12+0, 1
	GOTO       L_servir8
	DECFSZ     R11+0, 1
	GOTO       L_servir8
	NOP
	GOTO       L_servir9
L_servir7:
;servir.h,30 :: 		else if (tamanio == 'x'){
	MOVF       FARG_servir_tamanio+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L_servir10
;servir.h,31 :: 		Delay_ms(2500);}
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_servir11:
	DECFSZ     R13+0, 1
	GOTO       L_servir11
	DECFSZ     R12+0, 1
	GOTO       L_servir11
	DECFSZ     R11+0, 1
	GOTO       L_servir11
	NOP
	GOTO       L_servir12
L_servir10:
;servir.h,32 :: 		else {Delay_ms(1500);}
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servir13:
	DECFSZ     R13+0, 1
	GOTO       L_servir13
	DECFSZ     R12+0, 1
	GOTO       L_servir13
	DECFSZ     R11+0, 1
	GOTO       L_servir13
	NOP
	NOP
L_servir12:
L_servir9:
L_servir6:
L_servir3:
;servir.h,34 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;servir.h,35 :: 		PWM1_Set_Duty(30);
	MOVLW      30
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;servir.h,36 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servir14:
	DECFSZ     R13+0, 1
	GOTO       L_servir14
	DECFSZ     R12+0, 1
	GOTO       L_servir14
	DECFSZ     R11+0, 1
	GOTO       L_servir14
	NOP
	NOP
;servir.h,37 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;servir.h,38 :: 		}
L_end_servir:
	RETURN
; end of _servir

_main:

;P9a_pwm_a.c,3 :: 		void main() {
;P9a_pwm_a.c,4 :: 		InitMain();
	CALL       _InitMain+0
;P9a_pwm_a.c,6 :: 		while (1) {                         // endless loop
L_main15:
;P9a_pwm_a.c,7 :: 		servir('p');                        // p => pequeño , m => mediano , g => grande, x => extra grande (tamaño de la mascota)
	MOVLW      112
	MOVWF      FARG_servir_tamanio+0
	CALL       _servir+0
;P9a_pwm_a.c,8 :: 		}
	GOTO       L_main15
;P9a_pwm_a.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
