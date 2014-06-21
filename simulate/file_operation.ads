--  File operations for interpreter
--  Copyright (C) 2014 Tristan Gingold
--
--  GHDL is free software; you can redistribute it and/or modify it under
--  the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2, or (at your option) any later
--  version.
--
--  GHDL is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
--  for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with GHDL; see the file COPYING.  If not, write to the Free
--  Software Foundation, 59 Temple Place - Suite 330, Boston, MA
--  02111-1307, USA.

with Iirs; use Iirs;
with Iir_Values; use Iir_Values;
with Elaboration; use Elaboration;
with Grt.Files; use Grt.Files;

package File_Operation is
   Null_File : constant Natural := 0;

   --  Open a file.
   procedure File_Open (File : Iir_Value_Literal_Acc;
                        Name : Iir_Value_Literal_Acc;
                        Mode : Iir_Value_Literal_Acc;
                        File_Decl : Iir;
                        Stmt : Iir);

   procedure File_Open_Status (Status : Iir_Value_Literal_Acc;
                               File : Iir_Value_Literal_Acc;
                               Name : Iir_Value_Literal_Acc;
                               Mode : Iir_Value_Literal_Acc;
                               File_Decl : Iir;
                               Stmt : Iir);

   --  Close a file.
   --  If the file was not open, this has no effects.
   procedure File_Close_Text (File : Iir_Value_Literal_Acc; Stmt : Iir);
   procedure File_Close_Binary (File : Iir_Value_Literal_Acc; Stmt : Iir);

   procedure File_Destroy_Text (File : Iir_Value_Literal_Acc);
   procedure File_Destroy_Binary (File : Iir_Value_Literal_Acc);

   -- Elaborate a file_declaration.
   function Elaborate_File_Declaration
     (Instance: Block_Instance_Acc; Decl: Iir_File_Declaration)
     return Iir_Value_Literal_Acc;

   -- Write VALUE to FILE.
   -- STMT is the statement, to display error.
   procedure Write_Text (File: Iir_Value_Literal_Acc;
                         Value: Iir_Value_Literal_Acc);
   procedure Write_Binary (File: Iir_Value_Literal_Acc;
                           Value: Iir_Value_Literal_Acc);

   procedure Read_Binary (File: Iir_Value_Literal_Acc;
                          Value: Iir_Value_Literal_Acc);

   procedure Read_Length_Text (File : Iir_Value_Literal_Acc;
                               Value : Iir_Value_Literal_Acc;
                               Length : Iir_Value_Literal_Acc);

   procedure Read_Length_Binary (File : Iir_Value_Literal_Acc;
                                 Value : Iir_Value_Literal_Acc;
                                 Length : Iir_Value_Literal_Acc);

   procedure Untruncated_Text_Read (File : Iir_Value_Literal_Acc;
                                    Str : Iir_Value_Literal_Acc;
                                    Length : Iir_Value_Literal_Acc);

   --  Test end of FILE is reached.
   function Endfile (File : Iir_Value_Literal_Acc; Stmt : Iir)
     return Boolean;
end File_Operation;