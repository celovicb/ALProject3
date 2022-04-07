codeunit 50101 "BC MySubscribers"
{

    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    var
        TextMsg: Label 'You have selected %1', Comment = '%1:Customer name';
    begin
        Message(TextMsg, Customer.Name);
    end;
    //izmenaaa

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnAfterSalesPost', '', false, false)]
    local procedure OnAfterSalesPost(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; SalesHeader: Record "Sales Header"; Invoice: Boolean);
    begin
    end;

}