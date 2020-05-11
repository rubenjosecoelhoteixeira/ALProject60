pageextension 50007 PurchaseOrderExt extends "Purchase Order"
{
    trigger OnOpenPage()
    var
        Vendor: Record Vendor;
        VendorNotification: Notification;
        OpenVendor: Text;
        TextNotification: Label 'This Vendor has a Balance Due. Please check before sending orders.';
        TextNotificationAction: Label 'Check Balance Due';
    begin
        Vendor.Get("Buy-from Vendor No.");
        Vendor.CalcFields("Balance Due");
        if Vendor."Balance Due" > 0 then begin
            VendorNotification.Message(TextNotification);
            VendorNotification.Scope := NotificationScope::LocalScope;
            VendorNotification.SetData('VendorNo', Vendor."No.");
            VendorNotification.AddAction(TextNotificationAction, Codeunit::ActionHandler, 'OpenVendor');
            VendorNotification.Send();
        end;
    end;
}