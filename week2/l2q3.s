	AREA	RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC                    
    LDR R1, =DST                   
    MOV R2, #10

LOOP
    LDR R3, [R0], #4              
    STR R3, [R1], #4               
    SUBS R2, R2, #1                  
    BNE LOOP     


STOP B STOP
SRC DCD 0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555, 0x66666666, 0x77777777, 0x88888888, 0x99999999, 0xAAAAAAAA  ; Source data block (10 numbers)
	AREA mydata, DATA, READWRITE
DST DCD 0X0
	END