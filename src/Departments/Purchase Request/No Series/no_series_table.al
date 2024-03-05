table 50101 "No. Series Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code 1"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Description"; Text[100])
        {

            Caption = 'Description';
            Editable = false;
        }
        // field(3; "Process Type"; Text[20])
        // {

        //     Caption = 'Process Type';

        // }
        // field(4; "Sub Process Type"; Text[20])
        // {
        //     Caption = 'Sub Process Type';
        // }

        field(9; "Default Nos."; Boolean)
        {

            Caption = 'Default Nos.';
            trigger OnValidate()
            begin
                if ("Default Nos." = false) and (xRec."Default Nos." <> "Default Nos.") and ("Manual Nos." = false) then
                    Validate("Manual Nos.", true);
            end;
        }
        field(10; "Manual Nos."; Boolean)
        {

            Caption = 'Manual Nos.';
            trigger OnValidate()
            begin
                if ("Manual Nos." = false) and (xRec."Manual Nos." <> "Manual Nos.") and ("Default Nos." = false) then
                    Validate("Default Nos.", true);
            end;
        }
        field(11; "Date Order"; Boolean)
        {

            Caption = 'Date Order';
            trigger OnValidate()
            var
                NoSeriesLine: Record "No. Series Line";
            begin
                if not "Date Order" then
                    exit;
                FindNoSeriesLineToShow(NoSeriesLine);
                if not NoSeriesLine.FindFirst then
                    exit;
                if NoSeriesLine."Allow Gaps in Nos." then
                    Error(AllowGapsNotAllowedWithDateOrderErr);
            end;
        }
    }

    keys
    {
        key(Key1; "Code 1")
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

    trigger OnDelete()
    begin
        NoSeriesLine.SetRange("Series Code", "Code 1");
        NoSeriesLine.DeleteAll();

        NoSeriesRelationship.SetRange(Code, "Code 1");
        NoSeriesRelationship.DeleteAll();
        NoSeriesRelationship.SetRange(Code);

        NoSeriesRelationship.SetRange("Series Code", "Code 1");
        NoSeriesRelationship.DeleteAll();
        NoSeriesRelationship.SetRange("Series Code");
    end;

    var
        NoSeriesLine: Record "No. Series Line";
        NoSeriesRelationship: Record "No. Series Relationship";
        AllowGapsNotAllowedWithDateOrderErr: Label 'The Date Order setting is not possible for this number series because the Allow Gaps in Nos. check box is selected on one of the number series lines.';

    local procedure FindNoSeriesLineToShow(var NoSeriesLine: Record "No. Series Line")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        NoSeriesMgt.SetNoSeriesLineFilter(NoSeriesLine, "Code 1", 0D);

        if NoSeriesLine.FindLast then
            exit;

        NoSeriesLine.Reset();
        NoSeriesLine.SetRange("Series Code", "Code 1");
    end;

}