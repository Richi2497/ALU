module ALU(
	input [31:0] a_in,
	input [31:0] b_in,
	input	[3:0] select,
	output reg [31:0] out,
	output reg flagZ,
	output reg flagC
);	reg [32:0]flagt;
always @(*)
begin 
	case (select)
	4'b0000: out = a_in + b_in;		//ADD (SUMA DE DOS NUMEROS)
	4'b0001: out = a_in - b_in;		//SUBTRACT (RESTA DE DOS NUMEROS
	4'b0010: out = a_in & b_in;		//AND (OPERACION AND)
	4'b0011: out = a_in | b_in;		//OR (OPERACION OR)
	4'b0100: out = a_in ^ b_in;		//X-OR (OPERACION X-OR)
	4'b0101: out = a_in << b_in;		//DESPLAZAMIENTO LOGICO A LA IZQUIERDA SLL
	4'b0110: out = a_in >> b_in;		//DESPLAZAMIENTO LOGICO A LA DERECHA SRL
	4'b0111: out = $signed(a_in) >>> $signed(b_in);		//DESPLAZAMIENTO ARITMETICO A LA DERECHA SRA
	4'b1000: out = a_in;					//MUESTRA DE ENTRADA A
	4'b1001: out = b_in;					//MUESTRA DE ENTRADA B
	4'b1010: 	if ($signed(a_in) == $signed(b_in))		//BEQ (ES IGUAL A)
						out = 32'b1;
					else
						out = 32'b0;
	4'b1011:		if ($signed(a_in) != $signed(b_in))		//BNE (ES DESIGUAL A)
						out = 32'b1;
					else
						out = 32'b0;
	4'b1100:		if ($signed(a_in) << $signed(b_in))		//SLT (ES MENOR QUE)
						out = 32'b1;
					else 
						out= 32'b0;
	4'b1101:		if (a_in >> b_in)		//BLTU (MENOR QUE SIN SIGNO)
						out =32'b1;
					else
						out = 32'b1;
	default
	out= 32'b0;
	endcase	
		begin
	if(out == 32'b0)						//BANDERA DE 0
		flagZ = 1'b1;
	else 
		flagZ = 1'b0;
		end
	begin
	flagt = a_in + b_in;
	end
		begin
	if (flagt[32] == 1'b1)
		flagC = 1'b1;
	else
		flagC = 1'b0;
	end
end
endmodule