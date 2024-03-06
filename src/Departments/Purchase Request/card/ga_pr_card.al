page 50101 "GA PR Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "PurchaseRequisition Table";
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
                    trigger OnAssistEdit()// three dot 
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
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
            part(PartPurchase; "GA PR Card Subform")
            {
                ApplicationArea = All;
            }
        }
    }



    actions
    {

    }

    var
        GAHeader: Record "PurchaseRequisition Table";

        NoSeriesMgt: Codeunit NoSeriesManagement;

    // Text051: Label 'The service %1 %2 already exists.', Comment = '%1=Document type format;%2=Number;';


    procedure AssistEdit(OldServHeader: Record "PurchaseRequisition Table"): Boolean
    begin
        GAHeader.Copy(Rec);
        if NoSeriesMgt.SelectSeries(GetNoSeriesCode, OldServHeader."Document No.", Rec."Document No.") then begin

            NoSeriesMgt.SetSeries(Rec."Document No.");
            exit(true);
        end;
    end;

    local procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        NoSeriesCode := 'GA-DE-PR';
        OnBeforeGetNoSeries(Rec, NoSeriesCode, IsHandled);
        if not IsHandled then
            exit(NoSeriesCode);

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetNoSeries(var ServiceHeader: Record "PurchaseRequisition Table"; var NoSeriesCode: Code[20]; var IsHandled: Boolean)
    begin

    end;


}