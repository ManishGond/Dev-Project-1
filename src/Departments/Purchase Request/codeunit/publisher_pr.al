codeunit 50103 PublisherPr
{
    [IntegrationEvent(false, false)]
    procedure Approve()
    begin
    end;
}

codeunit 50106 PublisherPr2
{
    [IntegrationEvent(false, false)]
    procedure StatusChange(var ApprovalEntry: Record "Approval Entry")
    begin
    end;
}

