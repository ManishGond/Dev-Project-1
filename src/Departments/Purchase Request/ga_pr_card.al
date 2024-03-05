page 50101 "GA PR Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "GA PR Table";
    Caption = 'GA Purchase Requisition Card';
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    var
                        LookupPage: Page "No Series Page";
                        LookupRec: Record "No. Series Table";
                    begin
                        LookupRec.FindSet();
                        LookupPage.LookupMode(true);
                        if LookupPage.RunModal() = Action::LookupOK then begin
                            Rec."Document No." := LookupRec."Code 1";
                            Rec."Department Name" := LookupRec.Description;
                        end;
                    end;
                }





                field("Requestor Name"; Rec."Requestor Name") { ApplicationArea = All; }
                field("Document Type"; Rec."Document Type") { ApplicationArea = All; }
                field("Department Name"; Rec."Department Name") { ApplicationArea = All; }
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Document Date"; Rec."Document Date") { ApplicationArea = All; }
                field("Release Date"; Rec."Release Date") { ApplicationArea = All; }
                field("User ID"; Rec."User ID") { ApplicationArea = All; }
                field("Last Modified"; Rec."Last Modified") { ApplicationArea = All; }
            }
            group("Open Purchase Req Line")
            {
                repeater("")
                {
                    field("Item"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Line No."; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Item No."; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Unit of Measurement"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Description"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Description 2"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Requested Quantity"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Requestor User Id"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Requestor User Name"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Dept. Code"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Sub Account Code"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Date Needed"; myInt)
                    {
                        ApplicationArea = All;
                    }
                    field("Purpose"; myInt)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action(Save)
            {
                ApplicationArea = All;
                Image = Save;
                trigger OnAction()
                begin
                    // Save logic: Insert or modify the record
                end;
            }
        }
    }

    var
        myInt: Integer;
}