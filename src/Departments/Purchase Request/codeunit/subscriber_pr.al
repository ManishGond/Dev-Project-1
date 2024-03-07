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
    [EventSubscriber(ObjectType::Codeunit, Codeunit::PublishPr2, 'StatusChange', '', false, false)]

    local procedure StatusChangeFunc()
    begin
        PRTable.Status := PRTable.Status::Released;
        Message('Approved!');

    end;

    var
        PRTable: Record "PurchaseRequisition Table";
}