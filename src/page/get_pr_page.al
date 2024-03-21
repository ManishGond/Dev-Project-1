page 50102 GetPRPage
{
    PageType = StandardDialog;
    Caption = 'Get PR Page';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "GA PR Subform Table";
    CardPageId = "Purchase Order";
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
        PurchLine: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
    begin

        if CloseAction = Action::OK then begin
            PurchLine.SetRange(Type, rec.Type);
            PurchLine.FindSet();
            PurchLine."Document No." := rec."Document No.";
            PurchHeader.Modify();

        end
        else begin
            Message('Exited!');
            exit(true);
        end;

    end;


}