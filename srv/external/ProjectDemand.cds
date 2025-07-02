/* checksum : a2dacebf82fbd4e1c8242b50f0b8b116 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ProjectDemand {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Demand Distribution for Expense'
entity ProjectDemand.A_ProjDmndExpenseDistr {
  @sap.label : 'Dmnd f. Expn Distr'
  @sap.quickinfo : 'Global ID for the Distribution of a Demand for Expense'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDmndExpnDistributionUUID : UUID not null;
  @sap.label : 'Dmnd f. Expense UUID'
  @sap.quickinfo : 'Global Identification of a Demand for Expense'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandExpenseUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.label : 'Project Plan Item'
  @sap.quickinfo : 'Corresponding Line Item in Project Plan'
  ProjDmndReferencedPlanDataUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Distribution Period'
  @sap.quickinfo : 'Period to Which a Quantity is Distibuted'
  ProjDmndExpnDistrPeriodVal : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Year of Distribution'
  @sap.quickinfo : 'Year of a Distribution Period'
  ProjDmndExpnDistrYearVal : String(4);
  @sap.unit : 'ProjDmndExpnDistrAmountCrcy'
  @sap.variable.scale : 'true'
  @sap.label : 'Plannend Cost'
  ProjDmndExpnDistrAmount : Decimal(17, 3);
  @sap.unit : 'ProjDmndExpnDistrRevnAmtCrcy'
  @sap.variable.scale : 'true'
  @sap.label : 'Planned Revenue'
  ProjDmndExpnDistrRevenueAmt : Decimal(17, 3);
  @sap.label : 'Project UUID'
  @sap.quickinfo : 'Global ID of the Project to Which a Demand is Related'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectUUID : UUID;
  @sap.label : 'Referenced Object'
  @sap.quickinfo : 'UUID of the Object to Which a Demand Is Related'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ReferencedObjectUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndExpnDistrAmountCrcy : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndExpnDistrRevnAmtCrcy : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
  to_ProjectDemandExpense : Association to ProjectDemand.A_ProjectDemandExpense {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Resource Assignment'
entity ProjectDemand.A_ProjDmndResourceAssignment {
  @sap.label : 'Resource Assgmt UUID'
  @sap.quickinfo : 'Global Identification of a Resource Assignment to a Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDmndRsceAssgmtUUID : UUID not null;
  @sap.label : 'Resource Dmnd UUID'
  @sap.quickinfo : 'Global Identification of a Resource Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandWorkUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Resource'
  @sap.quickinfo : 'Personnel Number of a Resource'
  ProjDmndRsceAssgmt : String(8);
  @sap.unit : 'ProjDmndRsceAssgmtQuantityUnit'
  @sap.label : 'Assigned Quantity'
  @sap.quickinfo : 'Total Quantity of a Resource Assignment'
  ProjDmndRsceAssgmtQuantity : Decimal(13, 3);
  @sap.label : 'Quantity Unit'
  @sap.quickinfo : 'Unit of Measure for the Assigned Quantity'
  @sap.semantics : 'unit-of-measure'
  ProjDmndRsceAssgmtQuantityUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Resource Supply ID'
  @sap.quickinfo : 'Resource Supply ID of a Project Demand'
  ProjectDemandSupplyIdentifier : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Org.'
  @sap.quickinfo : 'Delivery Organization of the Assigned Resource'
  ProjectDemandSupplyDeliveryOrg : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Assignment Source'
  @sap.quickinfo : 'Source of a Resource Assignment'
  ProjectDemandSourceOfSupply : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source of Update'
  @sap.quickinfo : 'Source of Last Update to a Resource Assignment'
  ProjAssgmtLastUpdateSource : String(1);
  @sap.label : 'Work Assignment ID'
  @sap.quickinfo : 'Work Assignment ID (SAP One Domain Model)'
  ProjDmndRsceWorkAssgmtOID : String(100);
  @sap.label : 'Workforce Person ID'
  @sap.quickinfo : 'Workforce Person ID (SAP One Domain Model)'
  ProjDmndRsceWrkfrcPersonOID : String(36);
  @sap.display.format : 'Date'
  @sap.label : 'Demand Start Date'
  @sap.quickinfo : 'Start Date of the Demand'
  ProjDmndRsceAssgmtStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Demand End Date'
  @sap.quickinfo : 'End Date of the Demand'
  ProjDmndRsceAssgmtEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_AssgmtDistribution : Composition of many ProjectDemand.A_ProjDmndRsceAssgmtDistr {  };
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
  to_Work : Association to ProjectDemand.A_ProjectDemandResource {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Resource Assignment Distribution'
entity ProjectDemand.A_ProjDmndRsceAssgmtDistr {
  @sap.label : 'Assgmt Distr. UUID'
  @sap.quickinfo : 'Global Identification of a Resource Assignment Distribution'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDmndRsceAssgmtDistrUUID : UUID not null;
  @sap.label : 'Resource Assgmt UUID'
  @sap.quickinfo : 'Global Identification of a Resource Assignment to a Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDmndRsceAssgmtUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Year of Distribution'
  @sap.quickinfo : 'Year of a Distribution Period'
  ProjDmndRsceAssgmtDistrYearVal : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Distribution Period'
  @sap.quickinfo : 'Period to Which a Quantity is Distibuted'
  ProjDmndRsceAssgmtDistrPerdVal : String(3);
  @sap.unit : 'ProjDmndRsceAssgmtDistrQtyUnit'
  @sap.label : 'Distributed Quantity'
  @sap.quickinfo : 'Resource Quantity Assigned for a Distribution Period'
  ProjDmndRsceAssgmtDistrQty : Decimal(13, 3);
  @sap.label : 'Quantity Unit'
  @sap.quickinfo : 'Unit of Measure for the Distributed Quantity'
  @sap.semantics : 'unit-of-measure'
  ProjDmndRsceAssgmtDistrQtyUnit : String(3);
  @sap.unit : 'ProjDmndRsceDistrPerdAmtCur'
  @sap.variable.scale : 'true'
  @sap.label : 'Plannend Cost'
  ProjDmndRsceDistrPerdAmt : Decimal(17, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndRsceDistrPerdAmtCur : String(5);
  @sap.unit : 'ProjDmndRsceDistrRevenueAmtCur'
  @sap.variable.scale : 'true'
  @sap.label : 'Planned Revenue'
  ProjDmndRsceDistrRevenueAmt : Decimal(17, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndRsceDistrRevenueAmtCur : String(5);
  @sap.display.format : 'Date'
  @sap.label : 'Distr. Start Date'
  @sap.quickinfo : 'Start Date of the Distribution Period'
  ProjDmndRsceAssgmtDistrStrtDte : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Distr. End Date'
  @sap.quickinfo : 'End Date of the Distribution Period'
  ProjDmndRsceAssgmtDistrEndDte : Date;
  @sap.label : 'Deviation from Req.'
  @sap.quickinfo : 'Distribution entity indicates deviation from request'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDmndRsceDistrIsNotSupplied : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_Assignment : Association to ProjectDemand.A_ProjDmndResourceAssignment {  };
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Resource Request Distribution'
entity ProjectDemand.A_ProjDmndRsceReqDistribution {
  @sap.label : 'Request Distr. UUID'
  @sap.quickinfo : 'Global Identification of a Resource Request Distribution'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDmndRsceReqDistrUUID : UUID not null;
  @sap.label : 'Rsce Request UUID'
  @sap.quickinfo : 'Global Identification of a Resource Request'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDmndResourceRequestUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Year of Distribution'
  @sap.quickinfo : 'Year of a Distribution Period'
  ProjDmndRsceReqDistrYearVal : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Distribution Period'
  @sap.quickinfo : 'Period to Which a Quantity is Distibuted'
  ProjDmndRsceReqDistrPerdVal : String(3);
  @sap.unit : 'ProjDmndRsceReqDistrQtyUnit'
  @sap.label : 'Distributed Quantity'
  @sap.quickinfo : 'Resource Quantity Requested for a Distribution Period'
  ProjDmndRsceReqDistrQuantity : Decimal(13, 3);
  @sap.label : 'Quantity Unit'
  @sap.quickinfo : 'Unit of Measure for the Distributed Quantity'
  @sap.semantics : 'unit-of-measure'
  ProjDmndRsceReqDistrQtyUnit : String(3);
  @sap.unit : 'ProjDmndRsceReqDistrPerdAmtCur'
  @sap.variable.scale : 'true'
  @sap.label : 'Plannend Cost'
  ProjDmndRsceReqDistrPerdAmt : Decimal(17, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndRsceReqDistrPerdAmtCur : String(5);
  @sap.unit : 'ProjDmndRsceReqDistrRevnAmtCur'
  @sap.variable.scale : 'true'
  @sap.label : 'Planned Revenue'
  ProjDmndRsceReqDistrRevenueAmt : Decimal(17, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  ProjDmndRsceReqDistrRevnAmtCur : String(5);
  @sap.label : 'Project Plan Item'
  @sap.quickinfo : 'Corresponding Line Item in Project Plan'
  ProjDmndReferencedPlanDataUUID : UUID;
  @sap.display.format : 'Date'
  @sap.label : 'Distr. Start Date'
  @sap.quickinfo : 'Start Date of the Distribution Period'
  ProjDmndRsceReqDistrStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Distr. End Date'
  @sap.quickinfo : 'End Date of the Distribution Period'
  ProjDmndRsceReqDistrEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
  to_ProjDmndRsceReq : Association to ProjectDemand.A_ProjectDemandResourceRequest {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Project Demand'
entity ProjectDemand.A_ProjectDemand {
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandUUID : UUID not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand ID'
  @sap.quickinfo : 'External ID of a Project Demand'
  ProjectDemand : String(24);
  @sap.label : 'Demand Name'
  @sap.quickinfo : 'Project Demand Name'
  ProjectDemandName : String(40);
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of a Project Demand'
  ProjectDemandDescription : String(1000);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Category'
  @sap.quickinfo : 'Project Demand Category'
  ProjectDemandCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Type'
  @sap.quickinfo : 'Project Demand Type'
  ProjectDemandType : String(4);
  @sap.label : 'Referenced Object'
  @sap.quickinfo : 'UUID of the Object to Which a Demand Is Related'
  ReferencedObjectUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Status'
  @sap.quickinfo : 'Project Demand Status'
  ProjectDemandStatus : String(5);
  @sap.label : 'Date Alignment'
  @sap.quickinfo : 'Alignment of Project Demand Dates with WBS Element Dates'
  ProjectDemandDateMaintenance : String(2);
  @sap.display.format : 'Date'
  @sap.label : 'Demand Start Date'
  @sap.quickinfo : 'Start Date of the Demand'
  ProjectDemandStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Demand End Date'
  @sap.quickinfo : 'End Date of the Demand'
  ProjectDemandEndDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Requested On'
  @sap.quickinfo : 'Timestamp of Demand Status Change to &quot;Requested&quot;'
  ProjectDemandReleasedDateTime : DateTime;
  @sap.display.format : 'Date'
  @sap.label : 'Demand Delivery'
  @sap.quickinfo : 'Delivery Date of the Demand'
  ProjDmndActualSupplyDate : Date;
  @sap.unit : 'ProjectDemandRequestCurrency'
  @sap.variable.scale : 'true'
  @sap.label : 'Price Per Unit'
  @sap.quickinfo : 'Price per unit'
  ProjectDemandPerUnitAmount : Decimal(23, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Currency'
  @sap.quickinfo : 'Project Demand Currency'
  @sap.semantics : 'currency-code'
  ProjectDemandRequestCurrency : String(5);
  @sap.label : 'Quantity Unit'
  @sap.quickinfo : 'Unit of Measure for the Required Quantity'
  @sap.semantics : 'unit-of-measure'
  ProjDmndRequestedQuantityUnit : String(3);
  @sap.label : 'Price unit'
  PriceUnitQty : Decimal(5, 0);
  @sap.unit : 'ProjDmndReqNetAmountCurrency'
  @sap.variable.scale : 'true'
  @sap.label : 'Net Value'
  @sap.quickinfo : 'Estimated Net Value of the Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandRequestNetAmount : Decimal(23, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Currency'
  @sap.quickinfo : 'Project Demand Currency'
  @sap.semantics : 'currency-code'
  ProjDmndReqNetAmountCurrency : String(5);
  @sap.unit : 'ProjDmndReqNetAmountCurrency'
  @sap.variable.scale : 'true'
  @sap.label : 'Overall Cost'
  @sap.quickinfo : 'Overall Cost of the Project Demand'
  ProjectDemandOverallAmount : Decimal(23, 3);
  @sap.unit : 'ProjDmndReqNetAmountCurrency'
  @sap.variable.scale : 'true'
  @sap.label : 'Exptd Value'
  @sap.quickinfo : 'Expected Value of Overall Limit'
  ProjectDemandExpectedAmount : Decimal(23, 3);
  @sap.unit : 'ProjDmndRequestedQuantityUnit'
  @sap.label : 'Required Quantity'
  ProjDmndRequestedQuantity : Decimal(15, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Group'
  PurchasingGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of the Person Who Created the Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Timestamp of Object Creation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Changed By'
  @sap.quickinfo : 'User Who Last Changed a Demand (Sub-Entities Included)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandLastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Demand Changed On'
  @sap.quickinfo : 'Timestamp of Last Change to a Demand (Sub-Entities Included)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDemandLastChangeDateTime : Timestamp;
  @sap.label : 'External Reference'
  @sap.quickinfo : 'External UUID related to a Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDmndExternalReferenceUUID : UUID;
  @sap.unit : 'ProjDmndOverallRevenueCurrency'
  @sap.variable.scale : 'true'
  @sap.label : 'Overall Revenue'
  @sap.quickinfo : 'Overall Revenue of the Project Demand'
  ProjectDemandOverallRevenue : Decimal(23, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Currency'
  @sap.quickinfo : 'Project Demand Currency'
  @sap.semantics : 'currency-code'
  ProjDmndOverallRevenueCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data model Version'
  @sap.quickinfo : 'Data model Version for Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjDmndDataModelVersion : String(2);
  to_Expense : Composition of ProjectDemand.A_ProjectDemandExpense {  };
  to_Material : Composition of ProjectDemand.A_ProjectDemandMaterial {  };
  to_Service : Composition of ProjectDemand.A_ProjectDemandService {  };
  to_Work : Composition of ProjectDemand.A_ProjectDemandResource {  };
} actions {
  action ResetDemandStatusToRequested() returns ProjectDemand.A_ProjectDemand;
  action SetDemandStatusToClosed() returns ProjectDemand.A_ProjectDemand;
  action SetDemandStatusToRequested() returns ProjectDemand.A_ProjectDemand;
  action SetDmndStsToRequestOnRelease() returns ProjectDemand.A_ProjectDemand;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Demand for Expense'
entity ProjectDemand.A_ProjectDemandExpense {
  @sap.label : 'Dmnd f. Expense UUID'
  @sap.quickinfo : 'Global Identification of a Demand for Expense'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandExpenseUUID : UUID not null;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Expense Type'
  ProjectDemandExpenseType : String(40);
  @sap.label : 'Project UUID'
  @sap.quickinfo : 'Global ID of the Project to Which a Demand is Related'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectUUID : UUID;
  @sap.label : 'Referenced Object'
  @sap.quickinfo : 'UUID of the Object to Which a Demand Is Related'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ReferencedObjectUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Category'
  @sap.quickinfo : 'Billing Control Category'
  ProjDmndBillingControlCategory : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
  to_ProjDmndExpenseDistr : Composition of many ProjectDemand.A_ProjDmndExpenseDistr {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Material Demand'
entity ProjectDemand.A_ProjectDemandMaterial {
  @sap.label : 'Material Demand UUID'
  @sap.quickinfo : 'Global Identification for Material Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandMaterialUUID : UUID not null;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Number'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Desired Supplier'
  @sap.quickinfo : 'Desired Supplier for Project Demand'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Info Record'
  @sap.quickinfo : 'Info Record for Project Demand'
  PurchasingInfoRecord : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Doc Nmbr'
  @sap.quickinfo : 'Purchasing Document Number'
  PurchaseContract : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contract Item Numbr'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  PurchaseContractItem : String(5);
  @sap.label : 'Planned Deliv. Time'
  @sap.quickinfo : 'Planned Delivery Time in Days'
  MaterialPlannedDeliveryDurn : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PR Number'
  @sap.quickinfo : 'Purchase Requisition Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisition : String(10);
  @sap.label : 'Requisition/Item ID'
  @sap.quickinfo : 'Formatted Purchase Requisition Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FormattedPurRequisitionItem : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'PR Item Number'
  @sap.quickinfo : 'Purchase Requisition Item Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisitionItem : String(5);
  @sap.label : 'TRUE'
  @sap.quickinfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsPurOrderAllwdForInbDeliv : Boolean;
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderedQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StillToBeDeliveredQuantity : Decimal(14, 3);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InvoiceReceiptAmount : Decimal(21, 3);
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  RequestedQuantity : Decimal(13, 3);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  NetValueAmountInDocCurrency : Decimal(25, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  DocumentCurrency : String(5);
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ScheduleLineDeliveryDate : Date;
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SchedLineStscDeliveryDate : Date;
  @sap.label : 'Unit of Measure'
  @sap.quickinfo : 'Purchase requisition unit of measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  GoodsReceiptAmount : Decimal(21, 3);
  to_RootTP : Association to ProjectDemand.A_ProjectDemand {  };
  to_MaterialSupply : Composition of ProjectDemand.A_ProjectDemandMaterialSupply {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Material Supply Data'
entity ProjectDemand.A_ProjectDemandMaterialSupply {
  @sap.label : 'Mtrl Dmnd Sply UUID'
  @sap.quickinfo : 'UUID for the Material Demand Supply'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDemandMaterialSupplyUUID : UUID not null;
  @sap.label : 'Material Demand UUID'
  @sap.quickinfo : 'Global Identification for Material Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandMaterialUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'PR Number'
  @sap.quickinfo : 'Purchase Requisition Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisition : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'PR Item Number'
  @sap.quickinfo : 'Purchase Requisition Item Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisitionItem : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Requirement Plan'
  @sap.quickinfo : 'Project Demand Requirement Plan'
  ProjectDemandRequirementPlan : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Ind Req Itm'
  @sap.quickinfo : 'Project Demand Planned Independent Requirement Item'
  ProjDmndPlndIndepRqmtItem : String(60);
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation Item'
  @sap.quickinfo : 'Project Demand Reservation Item'
  ProjectDemandReservationItem : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Demand Reservation'
  @sap.quickinfo : 'Project Demand Reservation'
  ProjectDemandReservation : String(10);
  to_Material : Association to ProjectDemand.A_ProjectDemandMaterial {  };
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Resource Demand'
entity ProjectDemand.A_ProjectDemandResource {
  @sap.label : 'Resource Dmnd UUID'
  @sap.quickinfo : 'Global Identification of a Resource Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandWorkUUID : UUID not null;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  CostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Activity Type'
  ActivityType : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Assignment Status'
  @sap.quickinfo : 'Assignment Status of a Resource Demand'
  ProjDmndAssgmtStatus : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Work Item ID'
  @sap.quickinfo : 'ID of the Work Item to Which a Resource Demand is Related'
  ProjectElementWorkItem : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing Category'
  @sap.quickinfo : 'Billing Control Category'
  ProjDmndBillingControlCategory : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery Org.'
  @sap.quickinfo : 'Delivery Organization from Which a Resource is Required'
  ProjDmndRequestedDeliveryOrg : String(5);
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
  to_ResourceAssignment : Composition of many ProjectDemand.A_ProjDmndResourceAssignment {  };
  to_ResourceRequest : Composition of many ProjectDemand.A_ProjectDemandResourceRequest {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.content.version : '1'
@sap.label : 'Resource Request'
entity ProjectDemand.A_ProjectDemandResourceRequest {
  @sap.label : 'Rsce Request UUID'
  @sap.quickinfo : 'Global Identification of a Resource Request'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjDmndResourceRequestUUID : UUID not null;
  @sap.label : 'Resource Dmnd UUID'
  @sap.quickinfo : 'Global Identification of a Resource Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandWorkUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Resource'
  @sap.quickinfo : 'Personnel Number of a Resource'
  ProjectDemandRequestedResource : String(8);
  @sap.label : 'Staffing Instruction'
  @sap.quickinfo : 'Staffing Instruction for a Resource Demand'
  ProjDmndStfngInstructionText : String(1000);
  @sap.label : 'Work Assignment ID'
  @sap.quickinfo : 'Work Assignment ID (SAP One Domain Model)'
  ProjDmndRsceReqWorkAssgmtOID : String(100);
  @sap.label : 'Workforce Person ID'
  @sap.quickinfo : 'Workforce Person ID (SAP One Domain Model)'
  ProjDmndRsceReqWrkfrcPersonOID : String(36);
  @sap.display.format : 'Date'
  @sap.label : 'Demand Start Date'
  @sap.quickinfo : 'Start Date of the Demand'
  ProjDmndRsceReqStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Demand End Date'
  @sap.quickinfo : 'End Date of the Demand'
  ProjDmndRsceReqEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Created By User'
  CreatedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date Time'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Change Date Time'
  LastChangeDateTime : Timestamp;
  to_Work : Association to ProjectDemand.A_ProjectDemandResource {  };
  to_ProjDmndRsceReqDistr : Composition of many ProjectDemand.A_ProjDmndRsceReqDistribution {  };
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Demand'
entity ProjectDemand.A_ProjectDemandService {
  @sap.label : 'Service Dmnd UUID'
  @sap.quickinfo : 'Global Identification for Service Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandServiceUUID : UUID not null;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Number'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Desired Supplier'
  @sap.quickinfo : 'Desired Supplier for Project Demand'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Demand Info Record'
  @sap.quickinfo : 'Info Record for Project Demand'
  PurchasingInfoRecord : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing Doc Nmbr'
  @sap.quickinfo : 'Purchasing Document Number'
  PurchaseContract : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Contract Item Numbr'
  @sap.quickinfo : 'Item Number of Purchasing Document'
  PurchaseContractItem : String(5);
  @sap.label : 'Planned Deliv. Time'
  @sap.quickinfo : 'Planned Delivery Time in Days'
  MaterialPlannedDeliveryDurn : Decimal(3, 0);
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SchedLineStscDeliveryDate : Date;
  @sap.label : 'TRUE'
  @sap.quickinfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsPurOrderAllwdForInbDeliv : Boolean;
  @sap.label : 'Unit of Measure'
  @sap.quickinfo : 'Purchase requisition unit of measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'currency-code'
  DocumentCurrency : String(5);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  GoodsReceiptAmount : Decimal(21, 3);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InvoiceReceiptAmount : Decimal(21, 3);
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OpenQuantity : Decimal(16, 3);
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderedQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PR Number'
  @sap.quickinfo : 'Purchase Requisition Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisition : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'PR Item Number'
  @sap.quickinfo : 'Purchase Requisition Item Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisitionItem : String(5);
  @sap.display.format : 'Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ScheduleLineDeliveryDate : Date;
  @sap.unit : 'BaseUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StillToBeDeliveredQuantity : Decimal(14, 3);
  @sap.unit : 'DocumentCurrency'
  @sap.variable.scale : 'true'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  NetValueAmountInDocCurrency : Decimal(25, 3);
  to_RootTP : Association to ProjectDemand.A_ProjectDemand {  };
  to_ServiceSupply : Composition of ProjectDemand.A_ProjectDemandServiceSupply {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Supply Data'
entity ProjectDemand.A_ProjectDemandServiceSupply {
  @sap.label : 'Srvc Sply UUID'
  @sap.quickinfo : 'Global Identification for Service Supply'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ProjectDemandServiceSupplyUUID : UUID not null;
  @sap.label : 'Service Dmnd UUID'
  @sap.quickinfo : 'Global Identification for Service Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandServiceUUID : UUID;
  @sap.label : 'Demand UUID'
  @sap.quickinfo : 'Global Identification of a Project Demand'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProjectDemandUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'PR Number'
  @sap.quickinfo : 'Purchase Requisition Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisition : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'PR Item Number'
  @sap.quickinfo : 'Purchase Requisition Item Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PurchaseRequisitionItem : String(5);
  to_Service : Association to ProjectDemand.A_ProjectDemandService {  };
  to_Root : Association to ProjectDemand.A_ProjectDemand {  };
};

