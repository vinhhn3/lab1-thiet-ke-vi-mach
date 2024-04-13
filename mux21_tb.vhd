LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux21_tb IS
END ENTITY mux21_tb;

ARCHITECTURE behavior OF mux21_tb IS
  COMPONENT mux21
    PORT (
      x : IN STD_LOGIC;
      y : IN STD_LOGIC;
      s : IN STD_LOGIC;
      m : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL x_tb : STD_LOGIC := '0';
  SIGNAL y_tb : STD_LOGIC := '1';
  SIGNAL s_tb : STD_LOGIC := '0';
  SIGNAL m_tb : STD_LOGIC;

BEGIN
  uut : mux21 PORT MAP(
    x => x_tb,
    y => y_tb,
    s => s_tb,
    m => m_tb
  );

  -- Stimulus process
  stim_proc : PROCESS
  BEGIN
    -- Test case 1
    x_tb <= '0';
    y_tb <= '0';
    s_tb <= '0';
    WAIT FOR 10 ns;
    IF m_tb = '0' THEN
      REPORT "Test Case 1 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 1 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 2
    x_tb <= '1';
    y_tb <= '0';
    s_tb <= '0';
    WAIT FOR 10 ns;
    IF m_tb = '1' THEN
      REPORT "Test Case 2 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 2 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 3
    x_tb <= '0';
    y_tb <= '1';
    s_tb <= '0';
    WAIT FOR 10 ns;
    IF m_tb = '0' THEN
      REPORT "Test Case 3 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 3 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 4
    x_tb <= '1';
    y_tb <= '1';
    s_tb <= '0';
    WAIT FOR 10 ns;
    IF m_tb = '1' THEN
      REPORT "Test Case 4 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 4 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 5
    x_tb <= '0';
    y_tb <= '0';
    s_tb <= '1';
    WAIT FOR 10 ns;
    IF m_tb = '0' THEN
      REPORT "Test Case 5 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 5 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 6
    x_tb <= '1';
    y_tb <= '0';
    s_tb <= '1';
    WAIT FOR 10 ns;
    IF m_tb = '0' THEN
      REPORT "Test Case 6 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 6 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 7
    x_tb <= '0';
    y_tb <= '1';
    s_tb <= '1';
    WAIT FOR 10 ns;
    IF m_tb = '1' THEN
      REPORT "Test Case 7 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 7 Failed" SEVERITY ERROR;
    END IF;

    -- Test case 8
    x_tb <= '1';
    y_tb <= '1';
    s_tb <= '1';
    WAIT FOR 10 ns;
    IF m_tb = '1' THEN
      REPORT "Test Case 8 Passed" SEVERITY NOTE;
    ELSE
      REPORT "Test Case 8 Failed" SEVERITY ERROR;
    END IF;

    -- End simulation
    WAIT;
  END PROCESS;
END;