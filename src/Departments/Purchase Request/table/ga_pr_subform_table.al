table 50102 "GA PR Subform Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Type; Enum "GA PR Line Type Enum")
        {
            Caption = 'Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "GST/HST"; Option)
        {
            Caption = 'GST/HST';
            OptionMembers = " ",Acquisition,"Self Assessment",Rebate,"New Housing Rebates","Pension Rebate";
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(5; "Location Code"; Code[20])
        {

            Caption = 'Location Code';
        }
        field(7; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
        }
        field(8; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(9; "Reserved Quantity"; Integer)
        {
            Caption = 'Reserved Quantity';
            DataClassification = ToBeClassified;
        }
        field(10; "Unit Of Measure Code"; Code[20])
        {
            Caption = 'Unit Of Measure Code';

        }
        field(11; "Direct Unit Cost Excl. Tax"; Integer)
        {
            Caption = 'Direct Unit Cost Excl. Tax';
            DataClassification = ToBeClassified;
        }
        field(12; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            DataClassification = ToBeClassified;
        }
        field(13; "Tax Group Code"; Code[20])
        {
            Caption = 'Tax Group Code';
            DataClassification = ToBeClassified;
        }
        field(14; "Line Amount Excl.Tax"; Integer)
        {
            Caption = 'Line Amount Excl.Tax';
            DataClassification = ToBeClassified;
        }
        field(15; "Qty.to Recieve"; Integer)
        {
            Caption = 'Qty.to Recieve';
            DataClassification = ToBeClassified;
        }
        field(16; "Quantity Recieved"; Integer)
        {
            Caption = 'Quantity Recieved';
            DataClassification = ToBeClassified;
        }
        field(17; "Qty. to Invoice"; Integer)
        {
            Caption = 'Qty. to Invoice';
            DataClassification = ToBeClassified;
        }

    }



    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}