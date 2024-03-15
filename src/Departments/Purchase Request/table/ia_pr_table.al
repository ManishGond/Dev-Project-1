table 50111 "InventoryAsset table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = Order,Invoice;
            DataClassification = ToBeClassified;
        }
        field(2; "Buy-from Vendr No"; Code[10])
        {
            Caption = 'Buy-from Vendor No';
            DataClassification = ToBeClassified;
        }
        field(3; "Order Type"; Option)
        {
            Caption = 'Order Type';
            OptionMembers = Invenotry;
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[10])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(5; "Posting Date"; Date)
        {
            caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Due Date"; Date)
        {
            caption = 'Due Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Location Code"; code[10])
        {
            caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(8; "Deptt Code"; Code[10])
        {
            Caption = 'Deptt Code';
            DataClassification = ToBeClassified;
        }
        field(9; "Currency Code"; Code[5])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            OptionMembers = Open,"Pending Approval",Released;
            DataClassification = ToBeClassified;

        }
        field(11; "Department Type"; Option)
        {
            caption = 'Department type';
            OptionMembers = "GA Dept";
            DataClassification = ToBeClassified;
        }
        field(12; "Assigned User ID"; Text[50])
        {
            Caption = 'Assigned User ID';
            DataClassification = ToBeClassified;
        }
        field(13; "Required advance payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Advance payment amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}