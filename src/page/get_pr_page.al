page 50102 GetPRPage
{
    PageType = StandardDialog;
    Caption = 'Get PR Page';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "GA PR Subform Table";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;

                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Description2; Rec.Description2)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean;

    var
        table1: Record "Purchase Line";
        table2: Record "GA PR Subform Table";
    begin

        if CloseAction = Action::OK then begin
            table1.Type := table2.Type;
            table1.Description := table2.Description;
            table1."Description 2" := table2.Description2;
            table1.Modify();
        end
        else begin
            Message('Exited!');
            exit(true);
        end;

    end;


}