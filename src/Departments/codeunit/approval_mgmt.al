codeunit 50100 ApprovalMgmt
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        NothingToApproveErr: Label 'There is nothing to approve.';
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    procedure CheckSalesApprovalPossible(var SalesHeader: Record "PurchaseRequisition Table"): Boolean
    begin
        if not IsSalesApprovalsWorkflowEnabled(SalesHeader) then
            Error(NoWorkflowEnabledErr);

        if not SalesHeader.SalesLinesExist then
            Error(NothingToApproveErr);

        OnAfterCheckSalesApprovalPossible(SalesHeader);

        exit(true);
    end;

    procedure IsSalesApprovalsWorkflowEnabled(var SalesHeader: Record "PurchaseRequisition Table"): Boolean
    begin
        exit(WorkflowManagement.CanExecuteWorkflow(SalesHeader, WorkflowEventHandling.RunWorkflowOnSendSalesDocForApprovalCode));
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckSalesApprovalPossible(var SalesHeader: Record "PurchaseRequisition Table")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendSalesDocForApproval(var SalesHeader: Record "PurchaseRequisition Table")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnHasOpenApprovalEntriesOnAfterApprovalEntrySetFilters(var ApprovalEntry: Record "Approval Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCanCancelApprovalForRecord(RecID: RecordID; var Result: Boolean; var ApprovalEntry: Record "Approval Entry"; UserSetup: Record "User Setup")
    begin
    end;

    procedure HasOpenApprovalEntriesForCurrentUser(RecordID: RecordID): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange("Approver ID", UserId);
        ApprovalEntry.SetRange("Related to Change", false);

        exit(not ApprovalEntry.IsEmpty());
    end;

    procedure HasOpenApprovalEntries(RecordID: RecordID): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Table ID", RecordID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecordID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange("Related to Change", false);
        OnHasOpenApprovalEntriesOnAfterApprovalEntrySetFilters(ApprovalEntry);
        exit(not ApprovalEntry.IsEmpty);
    end;

    procedure CanCancelApprovalForRecord(RecID: RecordID) Result: Boolean
    var
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
    begin
        if not UserSetup.Get(UserId) then
            exit(false);

        ApprovalEntry.SetRange("Table ID", RecID.TableNo);
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        ApprovalEntry.SetFilter(Status, '%1|%2', ApprovalEntry.Status::Created, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange("Related to Change", false);

        if not UserSetup."Approval Administrator" then
            ApprovalEntry.SetRange("Sender ID", UserId);
        Result := ApprovalEntry.FindFirst();
        OnAfterCanCancelApprovalForRecord(RecID, Result, ApprovalEntry, UserSetup);
    end;

}