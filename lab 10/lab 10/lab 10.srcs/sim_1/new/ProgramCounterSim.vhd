----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 04:29:21 PM
-- Design Name: 
-- Module Name: ProgramCounterSim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramCounterSim is
--  Port ( );
end ProgramCounterSim;

architecture Behavioral of ProgramCounterSim is
COMPONENT ProgramCounter
    PORT( Res, Clk : IN STD_LOGIC;
          D : IN STD_LOGIC_VECTOR(2 downto 0);
          Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END COMPONENT;

SIGNAL Res, Clk : std_logic;
SIGNAL D, Q : std_logic_vector(2 downto 0);

begin
UUT : ProgramCounter PORT MAP(
    D => D,
    Res => Res,
    Clk => Clk,
    Q => Q );
    
Clock : process
begin
    Clk <= '0';
    WAIT FOR 1 ns;
    
    Clk <= '1';
    WAIT FOR 1 ns;
end process;
--INPUT SIGNAL = 100MHz (10 ns)
--SLOW CLOCK COUNT = 50 000 000  == 50_000_000
--SLOW CLOCK SIM = WAIT FOR 1 ns
--OUTPUT SIGNAL = 0.2Hz (2 s)
process
begin
    D <= "000";
    Res <= '0';
    WAIT FOR 500 ns;
-- Index Number: 210518H => 110 011 011 001 010 110
    
    D <= "110";
    Res <= '1';
    WAIT FOR 5 ms;
    
    D <= "010";
    Res <= '0';
    WAIT FOR 5 ms;
    
    D <= "001";
    Res <= '1';
    WAIT FOR 5 ms;
    
    D <= "011";
    Res <= '0';
    WAIT FOR 4 ms;
    
    D <= "011";
    Res <= '1';
    WAIT FOR 5 ms;
    
-- Index Number: 210170G => 110 011 010 011 111 010
    
    D <= "010";
    Res <= '0';
    WAIT FOR 7 ms;
    
    D <= "111";
    Res <= '1';
    WAIT FOR 5 ms;
    
    D <= "011";
    Res <= '0';
    WAIT FOR 3 ms;
    
    D <= "010";
    Res <= '1';
    WAIT FOR 5 ms;
    
    D <= "011";
    Res <= '0';
    WAIT FOR 2 ms;

end process;
end Behavioral;
