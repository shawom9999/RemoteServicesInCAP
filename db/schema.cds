using { ProjectDemandStatus_Read } from '../srv/external/ProjectDemandStatus_Read.cds'; 
namespace Dev;
using { cuid, managed, Currency } from '@sap/cds/common';

@assert.unique: { name: [name] }
entity Projects : cuid, managed {
  name: String(100) @mandatory;
  description: String(500);
  startDate: Date;
  endDate: Date;
  status: String(20);
  budget: Decimal(10,2);
  Currency: Currency;
  cost: Decimal(10,2);
  tasks: Composition of many Tasks on tasks.project = $self;
}

@assert.unique: { name: [name] }
entity Tasks : cuid {
  name: String(100) @mandatory;
  description: String(500);
  dueDate: Date;
  priority: String(20);
  completed: Boolean;
  category: Association to Category;
  project: Association to Projects;
}

@assert.unique: { name: [name] }
entity Category : cuid {
  name: String(50) @mandatory;
  description: String(100);
  tasks: Association to many Tasks on tasks.category = $self;
}
