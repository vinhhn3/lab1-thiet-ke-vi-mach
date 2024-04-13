LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY mux21 IS
  PORT (
    x : IN STD_LOGIC;
    y : IN STD_LOGIC;
    s : IN STD_LOGIC;
    m : OUT STD_LOGIC);
END ENTITY mux21;
ARCHITECTURE df OF mux21 IS
BEGIN -- architecture df
  m <= (y AND s) OR (x AND (NOT s));
END ARCHITECTURE df;