page 50100 "GA Purchase Requisition List"
{
    Caption = 'GA Purchase Requisition';
    PageType = List;
    Editable = true;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "PurchaseRequisition Table";
    CardPageId = "GA PR Card";
    //PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices & Discounts,Navigate,Customer';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }

                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;

                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Last Modified"; Rec."Last Modified")
                {
                    ApplicationArea = All;
                }


            }
        }

        area(FactBoxes)
        {

        }
    }
    actions
    {

    }
}