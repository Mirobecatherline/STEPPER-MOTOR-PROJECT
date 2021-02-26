                          
.model medium

.data


.code


         

portA:OUT 80H,AL
    RET 

portB:OUT 82H,AL 
    RET 
    
portC:OUT 84H,AL 
    RET      

DELAY: JCXZ @DELAY_END
	@DEL_LOOP:
	LOOP @DEL_LOOP	
	@DELAY_END:
	RET 


	   
start: MOV AX,@data
       MOV DS,AX
   
 
    
   ;INITIALISE 8255  
   MOV AL,80H
   OUT 86H,AL  
   MOV AL,88H
   MOV CX,03
   AGAIN:OUT 80H,AL
         CALL DELAY
         ROL AL,01 ;ROTATE REGISTER COUNT
         
         DEC CX
         JNZ AGAIN
           
           MOV AL,88H
           MOV CX,03
    AGAIN1:OUT 80H,AL
         CALL DELAY
         ROR AL,01 ;ROTATE REGISTER COUNT
         
         DEC CX
         JNZ AGAIN1
         
 
     
       
HLT
   
end start	             