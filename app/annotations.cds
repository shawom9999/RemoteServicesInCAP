using { Projects } from '../srv/service.cds';

annotate Projects.Projects with @UI.HeaderInfo: { TypeName: 'Project', TypeNamePlural: 'Projects', Title: { Value: name } };
annotate Projects.Projects with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate Projects.Projects with @UI.Identification: [{ Value: name }];
annotate Projects.Projects with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate Projects.Projects with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate Projects.Projects with {
  description @title: 'Description';
  startDate @title: 'Start Date';
  endDate @title: 'End Date';
  status @title: 'Status';
  budget @title: 'Budget';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate Projects.Projects with {
  budget @Measures.ISOCurrency: Currency_code;
  cost @Measures.ISOCurrency: Currency_code
};

annotate Projects.Projects with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: startDate },
 { $Type: 'UI.DataField', Value: endDate },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: budget }
];

annotate Projects.Projects with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: startDate },
 { $Type: 'UI.DataField', Value: endDate },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: budget },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate Projects.Projects with {
  tasks @Common.Label: 'Tasks'
};

annotate Projects.Projects with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate Projects.Projects with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Tasks', Target : 'tasks/@UI.LineItem' }
];

annotate Projects.Projects with @UI.SelectionFields: [
  name
];

annotate Projects.Tasks with @UI.HeaderInfo: { TypeName: 'Task', TypeNamePlural: 'Tasks', Title: { Value: name } };
annotate Projects.Tasks with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate Projects.Tasks with @UI.Identification: [{ Value: name }];
annotate Projects.Tasks with {
  category @Common.ValueList: {
    CollectionPath: 'Category',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate Projects.Tasks with {
  project @Common.ValueList: {
    CollectionPath: 'Projects',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: project_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'budget'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'cost'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate Projects.Tasks with @UI.DataPoint #dueDate: {
  Value: dueDate,
  Title: 'Due Date',
};
annotate Projects.Tasks with @UI.DataPoint #priority: {
  Value: priority,
  Title: 'Priority',
};
annotate Projects.Tasks with {
  name @title: 'Name';
  description @title: 'Description';
  dueDate @title: 'Due Date';
  priority @title: 'Priority';
  completed @title: 'Completed'
};

annotate Projects.Tasks with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: dueDate },
 { $Type: 'UI.DataField', Value: priority },
 { $Type: 'UI.DataField', Value: completed },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate Projects.Tasks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: dueDate },
 { $Type: 'UI.DataField', Value: priority },
 { $Type: 'UI.DataField', Value: completed },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate Projects.Tasks with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly };
  project @Common.Text: { $value: project.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate Projects.Tasks with {
  category @Common.Label: 'Category';
  project @Common.Label: 'Project'
};

annotate Projects.Tasks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#dueDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priority' }
];

annotate Projects.Tasks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate Projects.Tasks with @UI.SelectionFields: [
  category_ID,
  project_ID
];

annotate Projects.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate Projects.Category with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate Projects.Category with @UI.Identification: [{ Value: name }];
annotate Projects.Category with {
  description @title: 'Description'
};

annotate Projects.Category with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: description }
];

annotate Projects.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: description }
  ]
};

annotate Projects.Category with {
  tasks @Common.Label: 'Categories'
};

annotate Projects.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate Projects.Category with @UI.SelectionFields: [
  name
];

