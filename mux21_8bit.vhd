LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux21_8bit IS
  PORT (
    x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s : IN STD_LOGIC;
    m : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END ENTITY mux21_8bit;

ARCHITECTURE df OF mux21_8bit IS

  COMPONENT mux21
    PORT (
      x : IN STD_LOGIC;
      y : IN STD_LOGIC;
      s : IN STD_LOGIC;
      m : OUT STD_LOGIC
    );
  END COMPONENT mux21;

  SIGNAL m_internal : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

  -- Instantiating 8 instances of mux21
  mux_inst0 : mux21 PORT MAP(x(0), y(0), s, m_internal(0));
  mux_inst1 : mux21 PORT MAP(x(1), y(1), s, m_internal(1));
  mux_inst2 : mux21 PORT MAP(x(2), y(2), s, m_internal(2));
  mux_inst3 : mux21 PORT MAP(x(3), y(3), s, m_internal(3));
  mux_inst4 : mux21 PORT MAP(x(4), y(4), s, m_internal(4));
  mux_inst5 : mux21 PORT MAP(x(5), y(5), s, m_internal(5));
  mux_inst6 : mux21 PORT MAP(x(6), y(6), s, m_internal(6));
  mux_inst7 : mux21 PORT MAP(x(7), y(7), s, m_internal(7));

  -- Assigning the output
  m <= m_internal;

END ARCHITECTURE df;