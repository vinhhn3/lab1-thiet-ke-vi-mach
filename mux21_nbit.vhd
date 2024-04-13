LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux21_nbit IS
  GENERIC (
    DATA_WIDTH : INTEGER := 16);
  PORT (
    X : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
    Y : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
    s : IN STD_LOGIC;
    m : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0));
END ENTITY mux21_nbit;

ARCHITECTURE df OF mux21_nbit IS
  COMPONENT mux21 IS
    PORT (
      x : IN STD_LOGIC;
      y : IN STD_LOGIC;
      s : IN STD_LOGIC;
      m : OUT STD_LOGIC);
  END COMPONENT mux21;

  SIGNAL m_temp : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);

BEGIN -- ARCHITECTURE df
  mux21_gen : FOR i IN 0 TO DATA_WIDTH - 1 GENERATE
    mux21_i : mux21
    PORT MAP(
      x => X(i),
      y => Y(i),
      s => s,
      m => m_temp(i));
  END GENERATE mux21_gen;

  m <= m_temp;
END ARCHITECTURE df;