table 50101 "No. Series Table"
{
    DataClassification = ToBeClassified;
    Access = Public;

    fields
    {
        field(1; "Code 1"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Description"; Text[20])
        {
            Caption = 'Description';
        }
        field(3; "Starting Nos."; Code[50])
        {
            Caption = 'Starting Nos.';

        }
        field(4; "Ending No."; Code[50])
        {
            Caption = 'Ending No.';
        }
        field(5; "Process Type"; Option)
        {

            Caption = 'Process Type';
            OptionMembers = One,Two,Three;
        }
        field(6; "Sub Process Type"; Option)
        {
            Caption = 'Sub Process Type';
            OptionMembers = Four,Five,Six;
        }
        field(7; "Last Date Used"; Date)
        {

            Caption = 'Last Date Used';
        }
        field(8; "Last No. Used"; Date)
        {

            Caption = 'Last Date Used';
        }
        field(9; "Default Nos."; Boolean)
        {

            Caption = 'Default Nos.';
        }
        field(10; "Manual Nos."; Boolean)
        {

            Caption = 'Manual Nos.';
        }
        field(11; "Date Order"; Boolean)
        {

            Caption = 'Date Order';
        }
    }

    keys
    {
        key(Pk; "Code 1")
        {
            Clustered = true;
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