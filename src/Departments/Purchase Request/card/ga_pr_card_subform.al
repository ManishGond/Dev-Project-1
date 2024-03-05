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
                field("Line No.";Rec."Line No.")
                {
                    ApplicationArea = Suite;
                }
                field("Item No";Rec."Item No")
                {
                    ApplicationArea = All;
                }
                field("Unit Of Measure Code";Rec."Unit Of Measure Code")
                {
                    ApplicationArea = All;

                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;

                }
                field(Description2;Rec.Description2)
                {
                    ApplicationArea = All;

                }
                field("Reserved Quantity";Rec."Reserved Quantity")
                {
                    ApplicationArea = All;

                }
                field("Requestor User Id";Rec."Requestor User Id")
                {
                    ApplicationArea = All;

                }
                field("Requestor User Name";Rec."Requestor User Name")
                {
                    ApplicationArea = All;

                }
                field("Deptt Code";Rec."Deptt Code")
                {
                    ApplicationArea = All;

                }
                field("Sub Account Code";Rec."Sub Account Code")
                {
                    ApplicationArea = All;

                }
                field("Date Needed";Rec."Date Needed")
                {
                    ApplicationArea = All;

                }
                field(Purpose;Rec.Purpose)
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