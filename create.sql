create database hrdb;
use hrdb;

drop table if exists Customer;

create table Customer (
customerId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
customerName varchar(50),
address varchar(50),
country varchar(50),
zipCode varchar(50)
);

drop table if exists Employee;

Create table Employee (
employeeId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
emailId varchar(50) NOT NULL,
loginId varchar(50) NOT NULL,
loginPassword varchar(50),
managerId int,
address varchar(300),
designation varchar(50),
employeeType varchar(50),
departmentId int,
employementStatus varchar(50) NOT NULL,
dateOfJoin varchar(10),
createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
roleId int,
employeeCode varchar(50)
);

drop table if exists Department;


create table   Department(
departmentId      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
departmentName      varchar(50) NOT NULL,
parentDepartmentId      int ,
parentDepartmentName      varchar(50),
managerId      int,
startDate      TIMESTAMP,
endDate      TIMESTAMP,
createdTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table if exists Role;


create table Role(
roleid      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
roleName      varchar(50) NOT NULL,
parentRoleId      int,
createdTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into Role(
roleName,
parentRoleId
) values ('Director',null);

insert into Role(
roleName,
parentRoleId
) values ("Project Manager",1);

insert into Role(
roleName,
parentRoleId
) values ("Lead",2);

insert into Role(
roleName,
parentRoleId
) values ("Resource",3);

insert into Role(
roleName,
parentRoleId) values ("Admin",1);

insert into Role(
roleName,
parentRoleId
) values ("Reporter",1);


drop table if exists Task;


create table   Task(
taskId      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
taskName      varchar(500),
departmentId      int ,
customerId      int ,
createdTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table if exists Project;


create table   Project(
projectid      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
projectName      varchar(200) NOT NULL,
customerId int NOT NULL,
customerProgramId int NOT NULL,
departmentId int NOT NULL,
projectType      varchar(50) NOT NULL,
projectStatus      varchar(50) NOT NULL,
createdTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
location varchar(50),
customerProjectCode varchar(50)
);

drop table if exists GroupCodeValues;


create table GroupCodeValues (
groupid int NOT NULL AUTO_INCREMENT PRIMARY KEY,
groupName varchar(50) NOT NULL,
groupKey varchar(50) NOT NULL,
groupValue varchar(50) NOT NULL,
active int default 1
);

insert into GroupCodeValues (groupName,groupKey,groupValue) values ('employeeStatus','Active','Active');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('employeeStatus','Inactive','Inactive');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('customerProgramType','Captive','Captive');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('customerProgramType','Non-Captive','Non-Captive');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('Location','Hyderabad','Hyderabad');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('Location','Onsite','Onsite');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectType','Billable','Billable');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectType','Non-Billable','Non-Billable');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectStatus','Active','Active');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectStatus','Complete','Complete');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectStatus','OnHold','OnHold');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('ProjectStatus','Archive','Archive');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('employeeType','FTE','FTE');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('employeeType','CTE','CTE');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('leaveType','PTO','PTO');
insert into GroupCodeValues (groupName,groupKey,groupValue) values ('leaveType','EarnedLeave','EarnedLeave');

drop table if exists EmployeeLeaveApplied;


create table EmployeeLeaveApplied (
leaveId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
employeeId int NOT NULL,
leaveType varchar(50) NOT NULL,
fromDate varchar(10) NOT NULL,
toDate varchar(50) NOT NULL,
fromHours int,
toHours int,
noOfDays int NOT NULL,
appliedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
leaveStatus varchar(50) NOT NULL,
comments varchar(2000),
approvalManagerId int,
approvalManagerEmail varchar(250)
);

drop table if exists LeaveMaster;


create table LeaveMaster (
leaveMasterId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
roleId int not NULL,
roleName varchar(50) NOT NULL,
leaveType varchar(50) NOT NULL,
annualEligibility int
);

insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (1,'Director','PTO',14);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (1,'Director','EarnedLeave',6);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (2,'Project Manager','PTO',14);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (2,'Project Manager','EarnedLeave',6);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (3,'Lead','PTO',14);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (3,'Lead','EarnedLeave',6);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (4,'Resource','PTO',14);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (4,'Resource','EarnedLeave',6);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (5,'Admin','PTO',14);
insert into LeaveMaster(roleId,roleName,leaveType,annualEligibility) values (5,'Admin','EarnedLeave',6);


drop table if exists EmployeeLeaveBalance;


create table EmployeeLeaveBalance(
leaveBalanceId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
employeeId int NOT NULL,
annualYear int NOT NULL,
leaveType varchar(50) NOT NULL,
pendingApproval  int,
eligible int NOT NULL,
updatedTime TIMESTAMP,
updatedUser varchar(50)
);

drop table if exists CustomerProgramCode;


create table CustomerProgramCode (
customerProgramId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
customerId int NOT NULL,
programCode varchar(100) NOT NULL,
programType varchar(100) NOT NULL
);


drop table if exists timesheet;


create table timesheet (
timesheetId int NOT NULL AUTO_INCREMENT PRIMARY KEY,
weekStartDate varchar(10) NOT NULL,
weekEndDate varchar(10) NOT NULL,
employeeId int NOT NULL,
employeeDesination varchar(100),
employeeLocation varchar(50),
managerId int ,
managerName varchar(100),
managerEmail varchar(100),
customerId int NOT NULL,
customerName varchar(100),
customerProgramId int NOT NULL,
customerProgramCode varchar(100),
customerProgramType varchar(100),
departmentId int NOT NULL,
projectId int NOT NULL,
projectName varchar(100),
projectType varchar(100),
taskid int NOT NULL,
taskName varchar(100),
timesheetdate varchar(100) NOT NULL,
taskHours DECIMAL NOT NULL,
timesheetStatus varchar(50),
createdDate varchar(10),
approvedEmployeeId int ,
approvedUserName varchar(100),
overallStatus varchar(50),
comments varchar(1000),
createdBy varchar(50),
createdTimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedBy varchar(50),
updatedTimeStamp TIMESTAMP
);

drop view if exists timesheetSummary;


create view timesheetSummary as (
select e.employeeId as employeeId, e.firstName as firstName, e.lastName as lastName, t.weekStartDate as weekStartDate, t.weekEndDate as weekEndDate, sum(t.taskHours) as totalhours, t.timesheetStatus as timesheetStatus, t.createdDate as createdDate 
from timesheet t, Employee e
where t.employeeId = e.employeeId 
group by t.employeeId, t.weekStartDate order by t.weekStartDate desc
);

create table CustomerProgramProject (
customerProgramId int,
projectId int);
