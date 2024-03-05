table 50102 "GA PR Subform Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Type; Enum "GA PR Line Type Enum")
        {
            Caption = 'Type';
        }
        field(2; "Line No."; Code[20])
        {
            Caption = 'Line No.';
        }
        field(3; "Item No"; Code[20])
        {
            Caption = 'Item No';
            
        }
        field(4; "Unit Of Measure Code"; Code[20])
        {
            Caption = 'Unit Of Measure Code';

        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(6; Description2; Text[50])
        {
            Caption = 'Description2';
        }
        field(7; "Reserved Quantity"; Integer)
        {
            Caption = 'Reserved Quantity';
            DataClassification = ToBeClassified;
        }
        field(9; "Requestor User Id"; Integer)
        {
            Caption = 'Requestor User Id';
            DataClassification = ToBeClassified;
        }
        field(10; "Requestor User Name"; Integer)
        {
            Caption = 'Requestor User Name';
            DataClassification = ToBeClassified;
        }
        field(11; "Deptt Code";Code[20])
        {
            Caption = 'Deptt Code';
            DataClassification = ToBeClassified;
        }
        field(12; "Sub Account Code"; Code[20])
        {
            Caption = 'Sub Account code';
            DataClassification = ToBeClassified;
        }
        field(13; "Date Needed"; Date)
        {
            Caption = 'Date Needed';
            DataClassification = ToBeClassified;
        }
        field(14; "Purpose"; Option)
        {
            Caption = 'Purpose';
            OptionMembers=test,live;
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