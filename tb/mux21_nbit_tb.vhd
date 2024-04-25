LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux21_nbit_tb IS
END ENTITY mux21_nbit_tb;

ARCHITECTURE behavior OF mux21_nbit_tb IS
  -- Constants declaration
  CONSTANT DATA_WIDTH : INTEGER := 16;

  -- Component declaration
  COMPONENT mux21_nbit
    GENERIC (
      DATA_WIDTH : INTEGER := 16);
    PORT (
      X : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
      Y : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
      s : IN STD_LOGIC;
      m : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0));
  END COMPONENT mux21_nbit;

  -- Signals declaration
  SIGNAL X_tb : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
  SIGNAL Y_tb : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
  SIGNAL s_tb : STD_LOGIC;
  SIGNAL m_tb : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut : mux21_nbit
  GENERIC MAP(DATA_WIDTH => DATA_WIDTH)
  PORT MAP(
    X => X_tb,
    Y => Y_tb,
    s => s_tb,
    m => m_tb);

  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- Stimulus 1
    X_tb <= "1010101010101010";
    Y_tb <= "0101010101010101";
    s_tb <= '0';
    WAIT FOR 10 ns;
    ASSERT m_tb = X_tb REPORT "Output mismatch for Stimulus 1" SEVERITY ERROR;

    -- Stimulus 2
    X_tb <= "1111000011110000";
    Y_tb <= "0000111100001111";
    s_tb <= '1';
    WAIT FOR 10 ns;
    ASSERT m_tb = Y_tb REPORT "Output mismatch for Stimulus 2" SEVERITY ERROR;

    -- Stimulus 3
    X_tb <= "0000000011111111";
    Y_tb <= "1111111100000000";
    s_tb <= '0';
    WAIT FOR 10 ns;
    ASSERT m_tb = X_tb REPORT "Output mismatch for Stimulus 3" SEVERITY ERROR;

    -- Stimulus 4
    X_tb <= "0101010101010101";
    Y_tb <= "1010101010101010";
    s_tb <= '1';
    WAIT FOR 10 ns;
    ASSERT m_tb = Y_tb REPORT "Output mismatch for Stimulus 4" SEVERITY ERROR;

    -- Stimulus 5
    X_tb <= (OTHERS => '0');
    Y_tb <= (OTHERS => '1');
    s_tb <= '0';
    WAIT FOR 10 ns;
    ASSERT m_tb = X_tb REPORT "Output mismatch for Stimulus 5" SEVERITY ERROR;

    -- Stimulus 6
    X_tb <= (OTHERS => '1');
    Y_tb <= (OTHERS => '0');
    s_tb <= '1';
    WAIT FOR 10 ns;
    ASSERT m_tb = Y_tb REPORT "Output mismatch for Stimulus 6" SEVERITY ERROR;

    -- Stimulus 7
    X_tb <= "1111000000000000";
    Y_tb <= "0000111111111111";
    s_tb <= '0';
    WAIT FOR 10 ns;
    ASSERT m_tb = X_tb REPORT "Output mismatch for Stimulus 7" SEVERITY ERROR;

    -- Stimulus 8
    X_tb <= "0000111111111111";
    Y_tb <= "1111000000000000";
    s_tb <= '1';
    WAIT FOR 10 ns;
    ASSERT m_tb = Y_tb REPORT "Output mismatch for Stimulus 8" SEVERITY ERROR;

    -- Add more test cases as needed

    -- End of stimulus
    REPORT "END OF SIMULATION" SEVERITY NOTE;
    WAIT;
  END PROCESS stim_proc;

END ARCHITECTURE behavior;