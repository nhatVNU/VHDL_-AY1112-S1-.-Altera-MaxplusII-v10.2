---- and 2 ngo vao
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY and_2gate IS
PORT(
a : IN STD_LOGIC;
b : IN STD_LOGIC;
z : OUT STD_LOGIC);
END and_2gate;
ARCHITECTURE model OF and_2gate IS
BEGIN
z <= a AND b;
END model;

---- or 2 ngo vao
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY or_2gate IS
PORT(
a : IN STD_LOGIC;
b : IN STD_LOGIC;
z : OUT STD_LOGIC);
END or_2gate;
ARCHITECTURE model OF or_2gate IS
BEGIN
z <= a OR b;
END model;
---- cong not
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY not_gate IS
PORT(
a : IN STD_LOGIC;
z : OUT STD_LOGIC);
END not_gate;
ARCHITECTURE model OF not_gate IS
BEGIN
z <= NOT a;
END model;

--- ham f
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY tn7 IS
PORT(
X, Y, Z : IN STD_LOGIC;
F : OUT STD_LOGIC);
END tn7;
ARCHITECTURE structural OF tn7 IS
SIGNAL X1, Y1, F1, F2: STD_LOGIC;


COMPONENT and_2gate
PORT(
a : IN STD_LOGIC;
b : IN STD_LOGIC;
z : OUT STD_LOGIC);
END COMPONENT;


COMPONENT or_2gate
PORT(
a : IN STD_LOGIC;
b : IN STD_LOGIC;
z : OUT STD_LOGIC);
END COMPONENT;

COMPONENT not_gate
PORT(
a : IN STD_LOGIC;
z : OUT STD_LOGIC);
END COMPONENT;



BEGIN
u1: not_gate PORT MAP (X, X1);
u2: not_gate PORT MAP (Y, Y1);
u3: and_2gate PORT MAP (X1, Y, F1);
u4: and_2gate PORT MAP (Y1, Z, F2);
u5: or_2gate PORT MAP (F1, F2, F);

END structural;