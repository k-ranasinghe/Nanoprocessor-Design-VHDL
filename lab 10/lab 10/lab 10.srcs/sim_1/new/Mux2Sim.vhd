----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 06:56:40 PM
-- Design Name: 
-- Module Name: Mux2Sim - Behavioral
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

entity Mux2Sim is
--  Port ( );
end Mux2Sim;

architecture Behavioral of Mux2Sim is
COMPONENT Mux_2way_3bit
    PORT( Sel,Clk : IN STD_LOGIC;
          A,B : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          Y : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END COMPONENT;

SIGNAL Sel,Clk : std_logic;
SIGNAL A,B,Y : std_logic_vector(2 downto 0);


begin
UUT : Mux_2way_3bit PORT MAP(
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
    -- Index Number: 210518H => 110 011 011 001 010 110
    -- Index Number: 210170G => 110 011 010 011 111 010
    
    Sel <= '0';
    A <= "110";
    B <= "010";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "010";
    B <= "111";
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "001";
    B <= "011";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "011";
    B <= "010";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "011";
    B <= "011";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;
    
    Sel <= '0';
    A <= "110";
    B <= "110";
    WAIT FOR 50 ns;
    
    Sel <= '1';
    WAIT FOR 50 ns;

end process;
end Behavioral;
