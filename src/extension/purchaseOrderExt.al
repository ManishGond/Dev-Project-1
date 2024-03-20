pageextension 50100 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Document No."; Rec."Document No.")
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        addafter("P&osting")
        {

            action("Get Pr lines")
            {
                ApplicationArea = All;
                Caption = 'Get PR Lines';
                Enabled = true;

                trigger OnAction()
                var
                    table: Record "GA PR Subform Table";
                    test: Boolean;
                begin

                    table.SetRange(Status, table.Status::Released);

                    table.FindSet(test);
                    Page.Run(Page::GetPRPage, table);

                end;

            }

        }
    }

    var
        myInt: Integer;
}