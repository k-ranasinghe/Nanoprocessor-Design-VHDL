----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 11:51:57 AM
-- Design Name: 
-- Module Name: Mux1Sim - Behavioral
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

entity Mux1Sim is
--  Port ( );
end Mux1Sim;

architecture Behavioral of Mux1Sim is
COMPONENT Mux_2way_4bit
    PORT( Sel, Clk : IN STD_LOGIC;
          A,B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

SIGNAL Sel,Clk : std_logic;
SIGNAL A,B,Y : std_logic_vector(3 downto 0);

begin
UUT : Mux_2way_4bit PORT MAP(
    Sel => Sel,
    A => A,
    B => B,
    Y => Y,
    Clk => Clk); 
Clock : process
begin
    Clk <= '0';
    WAIT FOR 1 ns;
    Clk <= '1';
    WAIT FOR 1 ns;
end process;
process
    begin
    -- Index Number: 210518H => 11  0011 0110  0101 0110
    -- Index Number: 210170G => 11  0011 0100  1111 1010
    Sel <= '0';
    A <= "0110";
    B <= "1010";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "0101";
    B <= "1111";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "0110";
    B <= "0100";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "0011";
    B <= "0011";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
end process;
end Behavioral;

