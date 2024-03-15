page 50112 "InventoryAsset Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "InventoryAsset table";
    caption = 'InventoryAsset Card';
    Editable = true;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Document Type";Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ApplicationArea = All;  
                    ShowMandatory=true;
                    NotBlank=true;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update();
                        
                    end;
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
        IAHeader : Record "InventoryAsset table";
        NoSeriesmgt1 : Codeunit NoSeriesManagement;
        

    procedure AssistEdit(oldServHeader1 : Record "InventoryAsset table") : Boolean
    begin
        IAHeader.Copy(Rec);
         if NoSeriesMgt1.SelectSeries(GetNoSeriesCode1, OldServHeader1."No.", Rec."No.") then begin

            NoSeriesMgt1.SetSeries(Rec."No.");
            exit(true);
         end;
    end;
    local procedure GetNoSeriesCode1(): Code[20]
    var
        NoSeriesCode1: Code[20];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        NoSeriesCode1 := 'PR-PO';
        OnBeforeGetNoSeries1(Rec, NoSeriesCode1, IsHandled);
        if not IsHandled then
            exit(NoSeriesCode1);

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetNoSeries1(var ServiceHeader1: Record "InventoryAsset table"; var NoSeriesCode1: Code[20]; var IsHandled: Boolean)
    begin

    end;

}