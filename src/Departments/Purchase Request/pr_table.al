table 50100 "PurchaseRequisition Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Text[50])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Requestor Name"; Text[50])
        {
            Caption = 'Requestor Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = Order,Invoice;
            DataClassification = ToBeClassified;
        }
        field(4; "Department Name"; Text[50])
        {
            Caption = 'Department Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(6; "Status"; Text[10])
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Release Date"; Date)
        {
            Caption = 'Release Date';
            DataClassification = ToBeClassified;
        }
        field(9; "User ID"; Text[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(10; "Last Modified"; Date)
        {
            Caption = 'Last Modified';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Pk; "Document No.")
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

}