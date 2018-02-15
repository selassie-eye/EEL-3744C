/****
 * lab3a
 * Name: Khari Ollivierre
 * Section: 1490
 * TA: Samantha Soto
 * Description: Clock Configuration
****/

.include "ATxmega128A1Udef.inc"

; Define clock control/status and IOREG codes as constants
.equ CCTRL_32	= 0x01	; Selects 32 MHz clock
.equ OSCEN	= 0x02	; Enables 32 MHz clock
.equ CLKPS	= 0x14	; Configures prescaler to divide clock frequency by 8
.equ IOREG	= 0xD8

; Define CLKEVOUT code for PORTC_6 output ("00000001")
.equ CLKEVO	= 0x01	; 

MAIN: 
	RCALL CLKSEL
	SET PORTC_7 to output
	SET PORTCFG_CLKEVOUT to constant defined above
	WHILE true
	END WHILE
END MAIN

CLKSEL: 
	SET CPU_CCP to IOREG (0xD8)
	WHILE OSC_STATUS is ~(status constant for desired clock)
	END WHILE
	SET OSC_CTRL to (control constant for desired clock)
	SET CLK_PSCTRL to (chosen prescalar settings)
	SET CLK_CTRL to (control constant for desired clock)
	RET


	
