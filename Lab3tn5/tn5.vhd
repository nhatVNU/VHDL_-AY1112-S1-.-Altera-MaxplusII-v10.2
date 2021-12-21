LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY D_FF IS
PORT(
	D, CLK, PR, CL: IN STD_LOGIC;
	Q, Qn: BUFFER STD_LOGIC
);
END D_FF;
ARCHITECTURE BEHAVIOR OF D_FF IS
BEGIN 
	PROCESS(CLK, PR, CL)
	BEGIN	
		IF PR='0' THEN Q <= '1'; Qn <='0';
		ELSIF CL='0' THEN Q <= '0'; Qn <='1';
		ELSIF falling_edge(CLK) THEN Q <= D; Qn <= NOT Q;
	END IF;
	END PROCESS;
END BEHAVIOR;
---------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NAND_3 IS
PORT(
	A, B, C: IN STD_LOGIC;
	Z: OUT STD_LOGIC
);
END NAND_3;

ARCHITECTURE MODEL OF NAND_3 IS
SIGNAL U1: STD_LOGIC;
SIGNAL U2: STD_LOGIC;
BEGIN
	U1<=A AND B;
	U2<=C AND U1;
	Z <= NOT U2;

END MODEL;
----------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tn5 IS
PORT(
	CLK: IN STD_LOGIC;
	Q2, Q1, Q0, Q0n, Q2n, Q1n: BUFFER STD_LOGIC
);
END tn5;

ARCHITECTURE MODEL OF tn5 IS
SIGNAL U: STD_LOGIC;
----COMPONENT D_FF
COMPONENT D_FF
PORT(
	D, CLK, PR, CL: IN STD_LOGIC;
	Q, Qn: BUFFER STD_LOGIC
);
END COMPONENT;
----COMPONENT NAND_3
COMPONENT NAND_3 
PORT(
	A, B, C: IN STD_LOGIC;
	Z: OUT STD_LOGIC
);
END COMPONENT;
-----
BEGIN
U0: NAND_3 PORT MAP(Q2, Q1, Q0, U);
U1: D_FF PORT MAP(Q0n, CLK, '1', U, Q0, Q0n);
U2: D_FF PORT MAP(Q1n, Q0n, '1', '1', Q1, Q1n);
U3: D_FF PORT MAP(Q2n, Q1n, '1', U, Q2, Q2n);

END MODEL;