page 50103 "GA PR Card Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Ga Pr Subform Table";

    layout
    {
        area(Content)
        {
            repeater(control1)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;

                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                }
                field("GST/HST"; Rec."GST/HST")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;

                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;

                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;

                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ApplicationArea = All;

                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ApplicationArea = All;

                }
                field("Direct Unit Cost Excl. Tax"; Rec."Direct Unit Cost Excl. Tax")
                {
                    ApplicationArea = All;

                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = All;

                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = All;

                }
                field("Line Amount Excl.Tax"; Rec."Line Amount Excl.Tax")
                {
                    ApplicationArea = All;

                }
                field("Qty.to Recieve"; Rec."Qty.to Recieve")
                {
                    ApplicationArea = All;

                }
                field("Quantity Recieved"; Rec."Quantity Recieved")
                {
                    ApplicationArea = All;

                }
                field("Qty. to Invoice"; Rec."Qty. to Invoice")
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SelectMultiItems)
            {
                ApplicationArea = All;
                Caption = 'Select items';
                trigger OnAction()
                begin

                end;
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;

                    action("event")
                    {
                        ApplicationArea = All;
                        Caption = 'Event';
                        Image = "Event";

                        trigger OnAction()
                        begin

                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Planning;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        trigger onAction()
                        begin

                        end;
                    }
                    action(Location)
                    {
                        ApplicationArea = Location;
                        Caption = 'Location';
                        Image = Warehouse;
                        trigger onAction()
                        begin

                        end;
                    }
                    action(Lot)
                    {
                        ApplicationArea = Itemtracking;
                        Caption = 'Lot';
                        Image = LotInfo;
                        trigger onAction()
                        begin

                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Assembly';
                        Image = BOMLevel;
                        trigger onAction()
                        begin

                        end;
                    }
                }
                action("Reservation Entries")
                {
                    ApplicationArea = Reservation;
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;

                    trigger onaction()
                    begin

                    end;
                }
                action("Item trackng Lines")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    image = ItemTrackingLines;
                    trigger OnAction()
                    begin

                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Dimensions';
                    image = Dimensions;
                    trigger OnAction()
                    begin

                    end;
                }
            }
            group("&Functions")
            {
                action("Explode BOM")
                {
                    ApplicationArea = Assembly;
                    Caption = 'Explore BOM';
                    Image = ExplodeBOM;
                    trigger OnAction()
                    begin

                    end;
                }
                action("Insert Ext. Text")
                {
                    ApplicationArea = Suite;
                    Caption = 'Insert Ext. Text';
                    Image = Text;
                    trigger OnAction()
                    begin

                    end;
                }


            }
        }
    }

    var
        myInt: Integer;
}