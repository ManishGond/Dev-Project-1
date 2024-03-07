codeunit 50104 SubscriberPr
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherPr, 'Approve', '', false, false)]
    local procedure SubscriberPrFunc()
    begin
        Message('Sent for Approval 👌');
    end;
}

codeunit 50105 SubscriberPrManual
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublisherPr2, 'StatusChange', '', false, false)]

    local procedure StatusChangeFunc(var ApprovalEntry: Record "Approval Entry")
    begin
        ApprovalEntry.SetRange("Document No.");
        ApprovalEntry.FindSet();
        PRTable.Status := PRTable.Status::Released;
        Message('Approved!');

    end;

    var
        PRTable: Record "PurchaseRequisition Table";
}