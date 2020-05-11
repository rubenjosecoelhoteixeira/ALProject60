codeunit 50007 ActionHandler
{
    procedure OpenVendor(VendorNotification: Notification)
    var
        VendorCode: Text;
        Vendor: Record Vendor;
        VendorCard: Page "Vendor Card";
    begin
        VendorCode := VendorNotification.GetData('VendorNo');
        if Vendor.Get(VendorCode) then begin
            VendorCard.SetRecord(Vendor);
            VendorCard.Run();
        end;
    end;
}