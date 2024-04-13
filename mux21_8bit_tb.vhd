LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux21_8bit_tb IS
END ENTITY mux21_8bit_tb;

ARCHITECTURE behavior OF mux21_8bit_tb IS
  -- Component declaration for the Unit Under Test (UUT)
  COMPONENT mux21_8bit
    PORT (
      x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s : IN STD_LOGIC;
      m : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

  -- Declare signals
  SIGNAL x : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL y : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s : STD_LOGIC := '0';
  SIGNAL m : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut : mux21_8bit PORT MAP(
    x => x,
    y => y,
    s => s,
    m => m
  );

  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- Test case 1
    x <= "00000001";
    y <= "11111111";
    s <= '0';
    WAIT FOR 10 ns;
    ASSERT m = "00000001" REPORT "Test case 1 failed" SEVERITY ERROR;

    -- Test case 2
    x <= "00000010";
    y <= "10101010";
    s <= '1';
    WAIT FOR 10 ns;
    ASSERT m = "10101010" REPORT "Test case 2 failed" SEVERITY ERROR;

    -- Test case 3
    x <= "11111111";
    y <= "00000000";
    s <= '1';
    WAIT FOR 10 ns;
    ASSERT m = "00000000" REPORT "Test case 3 failed" SEVERITY ERROR;

    -- End the simulation
    REPORT "End simulation" SEVERITY NOTE;
    WAIT;
  END PROCESS stim_proc;

END ARCHITECTURE behavior;