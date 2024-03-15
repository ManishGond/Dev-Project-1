page 50111 "IA PR List"
{
    Caption='IA PR List';
    PageType = list;
    Editable=false;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "InventoryAsset table";
    CardPageId="InventoryAsset Card";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption=false;
                field("Document Type";Rec."Document Type")
                {
                   ApplicationArea=All;
                }
                field("Buy-from Vendr No";Rec."Buy-from Vendr No")
                {
                    caption = 'Buy-from Vendor No';
                    ApplicationArea = All;
                }
                field("Order Type";Rec."Order Type")
                {
                    Caption='Order Type';
                    ApplicationArea = All;
                }
                field("No.";Rec."No.")
                {
                    caption='No.';
                    ApplicationArea = All;
                }
                field("Posting Date";Rec."Posting Date")
                {
                    caption='Posting Date';
                    ApplicationArea = All;
                }
                field("Due Date";Rec."Due Date")
                {
                    Caption='Due Date';
                    ApplicationArea = All;
                }
                field("Location Code";Rec."Location Code")
                {
                    Caption='Location Code';
                    ApplicationArea = All;
                }
                field("Deptt Code";Rec."Deptt Code")
                {
                    Caption='Deptt Code';
                    ApplicationArea = All;
                }
                field("Currency Code";Rec."Currency Code")
                {
                    Caption='Currency Code';
                    ApplicationArea = All;
                }
                field(Status;Rec.Status)
                {
                    caption='Status';
                    ApplicationArea = All;
                }
                field("Department Type";Rec."Department Type")
                {
                    caption='Department Type';
                    ApplicationArea = All;
                }
                field("Assigned User ID";Rec."Assigned User ID")
                {
                    Caption='Assigned User ID';
                    ApplicationArea = All;
                }
                field("Required advance payment";Rec."Required advance payment")
                {
                    caption='Required advance payment';
                    ApplicationArea = All;
                }
                field("Advance payment amount";Rec."Advance payment amount")
                {
                    Caption='Advance payment amount';
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}