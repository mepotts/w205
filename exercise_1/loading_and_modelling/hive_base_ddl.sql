#Create schema for the hospitals table

DROP TABLE IF EXISTS hospitals;
CREATE EXTERNAL TABLE IF NOT EXISTS hospitals
(ProviderID varchar(500),
HospitalName varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIPCode varchar(500),
CountyName varchar(500),
PhoneNumber varchar(500),
HospitalType varchar(500),
HospitalOwnership varchar(500),
EmergencyServices varchar(500))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

#Create schema for the measures table

DROP TABLE IF EXISTS measures;
CREATE EXTERNAL TABLE IF NOT EXISTS measures
(MeasureName varchar(500),
MeasureID varchar(500),
MeasureStartQuarter varchar(500),
MeasureStartDate date,
MeasureEndQuarter varchar(500),
MeasureEndDate date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


#Create schema for the effective_care table

DROP TABLE IF EXISTS effective_care;
CREATE EXTERNAL TABLE IF NOT EXISTS effective_care
(ProviderID varchar(500),
HospitalName varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIPCode varchar(500),
CountyName varchar(500),
PhoneNumber varchar(500),
Condition varchar(500),
MeasureID varchar(500),
MeasureName varchar(500),
Score varchar(550),
Sample varchar(500),
Footnote varchar(500),
MeasureStartDate date,
MeasureEndDate date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


#Create schema for the readmissions table

DROP TABLE IF EXISTS readmissions;
CREATE EXTERNAL TABLE IF NOT EXISTS readmissions
(ProviderID varchar(500),
HospitalName varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIPCode varchar(500),
CountyName varchar(500),
PhoneNumber varchar(500),
MeasureName varchar(500),
MeasureID varchar(500),
ComparedtoNational varchar(500),
Denominator varchar(500),
Score varchar(500),
LowerEstimate varchar(500),
HigherEstimate varchar(500),
Footnote varchar(500),
MeasureStartDate date,
MeasureEndDate date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

#Create schema for the surveys_responses table

DROP TABLE IF EXISTS surveys_responses;
CREATE EXTERNAL TABLE IF NOT EXISTS surveys_responses
(ProviderNumber varchar(500),
HospitalName varchar(500),
Address varchar(500),
City varchar(500),
State varchar(500),
ZIPCode varchar(500),
CountyName varchar(500),
CommunicationwithNursesAchievementPoints varchar(500),
CommunicationwithNursesImprovementPoints varchar(500),
CommunicationwithNursesDimensionScore varchar(500),
CommunicationwithDoctorsAchievementPoints varchar(500),
CommunicationwithDoctorsImprovementPoints varchar(500),
CommunicationwithDoctorsDimensionScore varchar(500),
ResponsivenessofHospitalStaffAchievementPoints varchar(500),
ResponsivenessofHospitalStaffImprovementPoints varchar(500),
ResponsivenessofHospitalStaffDimensionScore varchar(500),
PainManagementAchievementPoints varchar(500),
PainManagementImprovementPoints varchar(500),
PainManagementDimensionScore varchar(500),
CommunicationaboutMedicinesAchievementPoints varchar(500),
CommunicationaboutMedicinesImprovementPoints varchar(500),
CommunicationaboutMedicinesDimensionScore varchar(500),
CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints varchar(500),
CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints varchar(500),
CleanlinessandQuietnessofHospitalEnvironmentDimensionScore varchar(500),
DischargeInformationAchievementPoints varchar(500),
DischargeInformationImprovementPoints varchar(500),
DischargeInformationDimensionScore varchar(500),
OverallRatingofHospitalAchievementPoints varchar(500),
OverallRatingofHospitalImprovementPoints varchar(500),
OverallRatingofHospitalDimensionScore varchar(500),
HCAHPSBaseScore int,
HCAHPSConsistencyScore int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';
