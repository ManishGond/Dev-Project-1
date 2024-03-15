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
                    ShowMandatory = true;
                    ApplicationArea = All;
                    NotBlank = true;
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
                SubPageLink = "Document No." = field("Document No.");
                SubPageView = order(ascending);
            }
        }


    }


    actions
    {

        area(Processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        RequestToApprove: Page "Requests to Approve Card";
                        RequestToApproveTable: Record "Approval Entry";
                        ApprovalRequestPublisher: Codeunit PublisherPr;


                    begin

                        RequestToApproveTable."Document No." := Rec."Document No.";
                        RequestToApproveTable."Sender ID" := UserId;
                        RequestToApproveTable."Approver ID" := UserId;


                        RequestToApproveTable.Status := RequestToApproveTable.Status::Open;
                        RequestToApproveTable.Insert(true);


                        Rec.Status := Rec.Status::"Pending Approval";
                        ApprovalRequestPublisher.Approve();



                    end;


                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Approval Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';



                }

            }
            group(Report)
            {
                Caption = 'Reports';
                Image = Report;
                action(ShowReport)
                {
                    Image = Print;
                    ApplicationArea = All;
                    trigger OnAction();
                    var
                        GA1: Record "PurchaseRequisition Table";

                    begin
                        GA1.SetFilter("Document No.", rec."Document No.");
                        Report.Run(Report::"GA PR Report",true,true,GA1);
                    end;
                }
            }
        }

    }
    var
        Test: Codeunit "Approvals Mgmt.";
        ApprovalEntryRecord: Record "Approval Entry";
        PurchaseRequisitionRecord: Record "PurchaseRequisition Table";
        PurchaseRequisistionid: RecordId;

    trigger OnAfterGetRecord()
    begin
        //SetControlVisibility;
    end;

    var
        GAHeader: Record "PurchaseRequisition Table";
        NoSeriesMgt: Codeunit NoSeriesManagement;


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