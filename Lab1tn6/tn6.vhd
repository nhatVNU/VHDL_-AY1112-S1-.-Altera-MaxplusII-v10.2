LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY tn6 IS
PORT ( X, Y, Z : IN STD_LOGIC;
F : OUT STD_LOGIC;
F1: BUFFER STD_LOGIC);
END tn6;
ARCHITECTURE kien_truc OF tn6 IS
SIGNAL X_NOT, Y_NOT, U : STD_LOGIC;
BEGIN
X_NOT <= not X;
F1 <= X_NOT and Y;
Y_NOT <= not Y;
U <=Y_NOT and Z;
F <= U or F1;
END kien_truc;
