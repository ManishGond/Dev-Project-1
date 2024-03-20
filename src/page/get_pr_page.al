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
        table3: Record "Purchase Header";
    begin

        if CloseAction = Action::OK then begin
            PurchLine."Document Type" := PurchLine."Document Type"::Order;
            PurchLine."Document No." := 'GADE-2019-00050';
            PurchLine.FindSet();
            PurchLine."Document No." := rec."Document No.";
            table3.Modify();
            // table2.SetRange("Document No.", table2."Document No.");
            // table2.FindSet();
            // repeat
            //     table2.Get(table1."Document No.");
            //     table1.Type := table2.Type;
            //     table1."No." := table2."Document No.";
            //     table1.Description := table2.Description;
            //     table1.Modify();
            // until table1.Next() = 0;

        end
        else begin
            Message('Exited!');
            exit(true);
        end;

    end;


}