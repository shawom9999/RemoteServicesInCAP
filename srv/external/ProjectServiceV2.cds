/* checksum : ad090cb3b0e43c5b02683f6879a527b7 */
/** Group Memberships */
@cds.external : true
@cds.persistence.skip : true
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.ReadRestrictions.Description : 'Read all the members of the groups in the projects'
@Capabilities.ReadRestrictions.LongDescription : 'Allows searching for groups by providing corresponding request parameters.'
@Capabilities.ReadRestrictions.ReadByKeyRestrictions.Description : 'Read a specific member of a group by key.'
@Capabilities.ReadRestrictions.ReadByKeyRestrictions.LongDescription : 'Retrieves the details of a specific member of a group by specifying its groupMembershipId, that you may have received from a different API call.'
@Capabilities.InsertRestrictions.Description : 'Adds a new member to the group specified by groupId passed in the request payload.'
@Capabilities.InsertRestrictions.LongDescription : 'The person specified by the businessPatnerId is added to the group.'
@Capabilities.DeleteRestrictions.Description : 'Remove a member of a group.'
@Capabilities.DeleteRestrictions.LongDescription : 'Removes the person from the group indicated by the groupMembershipId.'
@Capabilities.UpdateRestrictions.Updatable : false
entity service.ProjectServiceV2.GroupMemberships {
  /** When a person is added to a group, a groupMembershipId(unique,technical identifier) is assigned to that person(where groupId is the foreign key) */
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: '729cb8d9-f9d0-462a-896c-935cde6c15a5'
  }
  @Core.Computed : true
  key groupMembershipId : String(36) not null;
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: 'df3e8379-d3da-49c2-a10f-72d0a62af11e'
  }
  @Common.FieldControl : #Mandatory
  groupId : String(36) not null;
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: '09e99ce1-5c3b-3b4f-b37c-c791ca697e2a'
  }
  @Common.FieldControl : #Mandatory
  businessPartnerId : String(36) not null;
  toGroup : Association to one service.ProjectServiceV2.Groups on toGroup.groupId = groupId;
  toUser : Association to one service.ProjectServiceV2.Users on toUser.projectPartnerMembershipId = groupMembershipId;
};

/** Group */
@cds.external : true
@cds.persistence.skip : true
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Description : 'Create a group.'
@Capabilities.InsertRestrictions.LongDescription : 'Creates a group within a project.'
@Capabilities.ReadRestrictions.Description : 'Read all the user created groups of the projects.'
@Capabilities.ReadRestrictions.LongDescription : 'Allows searching for groups by providing corresponding request parameters.'
@Capabilities.ReadRestrictions.ReadByKeyRestrictions.Description : 'Read a group by key.'
@Capabilities.ReadRestrictions.ReadByKeyRestrictions.LongDescription : 'Retrieves the details of a specific group by specifying its group Id, that you may have received from a different API call.'
@Capabilities.UpdateRestrictions.Description : 'Update a group.'
@Capabilities.UpdateRestrictions.LongDescription : 'Updates the group metadata.'
@Capabilities.DeleteRestrictions.Description : 'Delete a group.'
@Capabilities.DeleteRestrictions.LongDescription : 'Deletes the group within the project.'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: toGroupMemberships,
    TopSupported: false,
    SkipSupported: false,
    SortRestrictions: { Sortable: false },
    InsertRestrictions: { Insertable: false }
  }
]
entity service.ProjectServiceV2.Groups {
  /** Unique, technical identifier of the group */
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: 'df3e8379-d3da-49c2-a10f-72d0a62af11e'
  }
  @Core.Computed : true
  key groupId : String(36) not null;
  /**
   * The type of group
   * 
   * There are three type of groups: EVERYONE, PROJECT_PARTNER, and GROUP. The EVERYONE AND PROJECT_PARTNER groups are created automatically and cannot be modified (change name, change description, add/remove members). Examples of groups of type GROUP are project administrator group and manually created groups. These can be modified (change name, change description, add/remove members).
   */
  @Core.Example : { $Type: 'Core.PrimitiveExampleValue', Value: 'GROUP' }
  @Core.Computed : true
  @Validation.AllowedValues : [
    { $Type: 'Validation.AllowedValue', Value: 'GROUP' },
    { $Type: 'Validation.AllowedValue', Value: 'PROJECT_PARTNER' },
    { $Type: 'Validation.AllowedValue', Value: 'EVERYONE' }
  ]
  type : String(16);
  /** Scenario */
  @Core.Immutable : true
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: '9fa33af6-ef34-4aa3-9c45-238fc976a9c5'
  }
  @Common.FieldControl : #Mandatory
  projectId : String(40) not null;
  /** Name */
  @Core.Example : { $Type: 'Core.PrimitiveExampleValue', Value: 'Group-1 name' }
  @Common.FieldControl : #Mandatory
  name : String(255) not null;
  @Core.Example : {
    $Type: 'Core.PrimitiveExampleValue',
    Value: 'This is a group created on API Hub'
  }
  description : String(255);
  toGroupMemberships : Association to many service.ProjectServiceV2.GroupMemberships {  };
};

@cds.external : true
@cds.persistence.skip : true
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.Updatable : false
entity service.ProjectServiceV2.Users {
  key projectPartnerMembershipId : String(36) not null;
  projectMembershipId : String(36);
  userRoleName : String(255);
  parentProjectPartnerId : String(36);
  parentCompanyRoleName : String(255);
  projectId : String(40);
  businessPartnerId : String(36);
  businessPartnerParentId : String(36);
  firstName : String(225);
  middleName : String(225);
  lastName : String(225);
  emailAddress : String(241);
  phoneNumber : String(30);
  cellPhoneNumber : String(30);
  faxNumber : String(30);
  country : String(40);
  region : String(40);
  cityName : String(40);
  postalCode : String(40);
  streetName : String(128);
};

/**
 * Project Service
 * 
 * This API allows you to work with groups and group memberships in SAP Project and Resource Management. Groups are mainly used for specifying authorization groups within a collaboration project.
 */
@cds.external : true
service service.ProjectServiceV2 {};

