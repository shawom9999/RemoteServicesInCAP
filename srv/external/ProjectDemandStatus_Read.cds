/* checksum : 8622a77daa8cc5cddfce6554fce71977 */
@cds.external : true
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features : {
  DocumentDescriptionReference: '../../../../default/iwbep/common/0001/$metadata',
  DocumentDescriptionCollection: 'MyDocumentDescriptions',
  ArchiveFormat: true,
  Border: true,
  CoverPage: true,
  FitToPage: true,
  FontName: true,
  FontSize: true,
  HeaderFooter: true,
  IANATimezoneFormat: true,
  Margin: true,
  Padding: true,
  ResultSizeDefault: 20000,
  ResultSizeMaximum: 20000,
  Signature: true,
  TextDirectionLayout: true,
  Treeview: true,
  UploadToFileShare: true
}
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service ProjectDemandStatus_Read {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Demand Status'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #group 
@Capabilities.SearchRestrictions.SearchSyntax : 'https://url.sap/odata-search'
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Text' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ProjectDemandStatus_Read.ProjectDemandStatus {
  @Common.SAPObjectNodeTypeReference : 'ProjectDemandStatus'
  @Common.Text : ProjectDemandStatusText
  @Common.IsUpperCase : true
  @Common.Label : 'Demand Status'
  @Common.QuickInfo : 'Project Demand Status'
  key ProjectDemandStatus : String(5) not null;
  @Common.Label : 'Demand Status Name'
  @Common.QuickInfo : 'Name of the Project Demand Status'
  ProjectDemandStatusText : String(40) not null;
  @Common.Composition : true
  _Text : Composition of many ProjectDemandStatus_Read.ProjectDemandStatusText {  };
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Demand Status Description'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #group 
@Capabilities.SearchRestrictions.SearchSyntax : 'https://url.sap/odata-search'
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Status' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ProjectDemandStatus_Read.ProjectDemandStatusText {
  @Common.SAPObjectNodeTypeReference : 'ProjectDemandStatus'
  @Common.Text : ProjectDemandStatusText
  @Common.IsUpperCase : true
  @Common.Label : 'Demand Status'
  @Common.QuickInfo : 'Project Demand Status'
  key ProjectDemandStatus : String(5) not null;
  @Common.Label : 'Language Key'
  @Common.Heading : 'L'
  @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LANGU'
  key Language : String(2) not null;
  @Common.Label : 'Demand Status Name'
  @Common.QuickInfo : 'Name of the Project Demand Status'
  ProjectDemandStatusText : String(40) not null;
  _Status : Association to one ProjectDemandStatus_Read.ProjectDemandStatus {  };
};

