----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 06:05:37 PM
-- Design Name: 
-- Module Name: Mux_2way_4bit - Behavioral
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

entity Mux_2way_4bit is
    Port ( Sel, Clk : in STD_LOGIC;
           A,B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_2way_4bit;

architecture Behavioral of Mux_2way_4bit is

begin

    process(Clk,Sel)
        begin
            if (rising_edge(Clk)) then
            case Sel is
                when '0' =>  Y <= A;
                when '1' =>  Y <= B;
                when others => Y <= "UUUU";
            end case;
            end if;
    end process; 
    
end Behavioral;