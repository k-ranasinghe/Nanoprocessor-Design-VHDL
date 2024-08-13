----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 06:16:14 PM
-- Design Name: 
-- Module Name: MicroProcessorSim - Behavioral
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

entity MicroProcessorSim is
--  Port ( );
end MicroProcessorSim;

architecture Behavioral of MicroProcessorSim is
COMPONENT MicroProcessor
    PORT( Res,Clk : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR(3 downto 0);
          Zero, Overflow : out STD_LOGIC;
          S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

SIGNAL Res, Clk : std_logic;
SIGNAL S : std_logic_vector(3 downto 0);
SIGNAL Zero, Overflow : std_logic;
SIGNAL S_7Seg : std_logic_vector(6 downto 0);

begin
UUT : MicroProcessor PORT MAP(
    Res => Res,
    Clk => Clk,
    S => S,
    Zero => Zero, 
    Overflow =>Overflow, 
    S_7Seg => S_7Seg);
    
Clock : process
    begin
        Clk <= '0';
        WAIT FOR 1 ns;
        
        Clk <= '1';
        WAIT FOR 1 ns;
    end process;
    
process
    begin
    
    Res <= '1';
    WAIT FOR 2 ms;

    Res <= '0';
    WAIT FOR 40 ms;
    
    Res <= '1';
    WAIT FOR 5 ms;

    Res <= '0';
    WAIT FOR 40 ms;
    WAIT;
end process; 
end Behavioral;
