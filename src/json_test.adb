with Ada.Text_IO;
with GNATCOLL.JSON;
with Helpers;

procedure Json_Test is
   use Ada.Text_IO;
   use GNATCOLL.JSON;
   use Helpers;

   Company_JSON : JSON_Value := Create_Object;
   Test_JSON    : JSON_Value;
begin
   Set_Core_Company_Data (Obj     => Company_JSON,
                          Name    => "AdaHeads K/S",
                          VAT_No  => "134679-zoink",
                          Hours   => "24/7",
                          Product => "Software development.",
                          Web     => "adaheads.com");

   Add_Company_Address (Obj         => Company_JSON,
                        Street_Name => "Mosekrogen",
                        Street_No   => 3,
                        Zip_Code    => "3520",
                        City_Name   => "Farum",
                        Phone       => "+45 11223344",
                        Comment     => "Headquarters");

   Add_Company_Address (Obj         => Company_JSON,
                        Street_Name => "Granvej",
                        Street_No   => 6,
                        Zip_Code    => "3660",
                        City_Name   => "Stenløse",
                        Phone       => "+45 22334455",
                        Comment     => "Branch office, Thomas Løcke");

   Add_Person (Obj   => Company_JSON,
               Name  => "Thomas Løcke",
               Title => "Codemonkey",
               Email => "thomas.locke@adaheads.com");

   Add_Person (Obj   => Company_JSON,
               Name  => "Kim Rostgaard Christensen",
               Title => "Codemonkey",
               Email => "kim.rostgaard.christensen@adaheads.com");

   Put_Line (Write (Company_JSON, False));

   Test_JSON := Read (Strm     => Load_File ("test.json"),
                      Filename => "");

   Map_JSON_Object (Val   => Test_JSON,
                    CB    => Handler'Access);
end Json_Test;
