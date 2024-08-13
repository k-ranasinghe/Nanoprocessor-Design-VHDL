----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 12:17:57 PM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( JumpCheck : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (11 downto 0);
           Reg1, Reg2, Jump : out STD_LOGIC_VECTOR(2 downto 0);
           LoadSel, OpSel, Jflag : out STD_LOGIC;
           Val : out STD_LOGIC_VECTOR(3 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
    signal Op : std_logic_vector(1 downto 0);

begin
    Op <= A(11 downto 10);
    Reg1 <= A(9 downto 7);
    Reg2 <= A(6 downto 4);
    Val <= A(3 downto 0);
    Jump <= A(2 downto 0);
    
    process (Op,JumpCheck) 
        begin

            case Op is    
                when "00" =>  OpSel <= '0'; LoadSel <= '0'; Jflag <= '0'; 
                when "01" =>  OpSel <= '1'; LoadSel <= '0'; Jflag <= '0'; 
                when "10" =>  LoadSel <= '1'; OpSel <= '0'; Jflag <= '0'; 
                when "11" =>  
                case JumpCheck is
                    when '1' => Jflag <= '1'; OpSel <= '0'; LoadSel <= '0'; 
                    when others => Jflag <= '0'; OpSel <= '0'; LoadSel <= '0';
                end case;
                when others => Jflag <= '0'; OpSel <= '0'; LoadSel <= '0';
            end case;           

    end process;
    
end Behavioral;
