LOAD    R1,Text  ;the start of the string (firs we are going to make count our progam)
LOAD    R2,1     ;its necessary to increase step
LOAD    R3,-1    ;its necessary to decrease step
LOAD    R5,0      
     COUNTTEXT:                   ;we need this(nextchar to ready)
         addi    R1,R1,R2         ;part to count number of text
jmpEQ R1=R0,NEXTCHAR 
         addi R5,R5,R2
JMP  COUNTTEXT    
           NEXTCHAR: 
           load R0,10    ;string terminator
           load R1,[R5]  ;start of the string
        PRINT: 
	     load RF,[R1]     ;get character and print it on display
	     addi R1,R1,R3    ;decrease the text from end of the string
jmpeq RF=R0, FINISH       ; when it comes string terminator,next step is FINISH
    jmp PRINT
             FINISH:
                  HALT
Text:  
       db  10                          ;string terminator for nextchar
       db "BARAN HASAN BOZDUMAN",0
