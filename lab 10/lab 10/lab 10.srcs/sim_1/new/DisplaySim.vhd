----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 01:25:18 PM
-- Design Name: 
-- Module Name: DisplaySim - Behavioral
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

entity DisplaySim is
--  Port ( );
end DisplaySim;

architecture Behavioral of DisplaySim is
    component Display is
    port (
        A : in std_logic_vector(3 downto 0);
        S_7Seg : out std_logic_vector(6 downto 0));

    end component;
    
    signal A : std_logic_vector(3 downto 0) := "0000";
    signal S_7Seg : std_logic_vector(6 downto 0);
    
begin
    UUT : Display PORT MAP (
        A => A,
        S_7Seg => S_7Seg
    );

process
    begin
    
    A <= "0000";
    wait for 5 ns;
    
    A <= "0001";
    wait for 5 ns;
    
    A <= "0010";
    wait for 5 ns;
    
    A <= "0011";
    wait for 5 ns;
    
    A <= "0100";
    wait for 5 ns;
    
    A <= "0101";
    wait for 5 ns;
    
    A <= "0110";
    wait for 5 ns;
    
    A <= "0111";
    wait for 5 ns;
    
    A <= "1000";
    wait for 5 ns;
    
    A <= "1001";
    wait for 5 ns;
    
    A <= "1010";
    wait for 5 ns;
    
    A <= "1011";
    wait for 5 ns;
    
    A <= "1100";
    wait for 5 ns;
    
    A <= "1101";
    wait for 5 ns;
    
    A <= "1110";
    wait for 5 ns;
    
    A <= "1111";
    wait;
        wait;
end process;
end Behavioral;
