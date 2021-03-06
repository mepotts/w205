#SparkSQL transformations of the tables

DROP TABLE IF EXISTS hospitals_parquet;
CREATE TABLE hospitals_parquet
AS
SELECT * FROM hospitals;


DROP TABLE IF EXISTS measures_parquet;
CREATE TABLE measures_parquet
AS
SELECT * FROM measures;


DROP TABLE IF EXISTS effective_care_parquet;
CREATE TABLE effective_care_parquet
AS
SELECT
ProviderID,
Condition,
MeasureID,
Score,
Sample,
Footnote
FROM effective_care;


DROP TABLE IF EXISTS readmissions_parquet;
CREATE TABLE readmissions_parquet
AS
SELECT
ProviderID,
MeasureID,
ComparedtoNational,
Denominator,
Score,
LowerEstimate,
HigherEstimate,
Footnote
FROM readmissions;


DROP TABLE IF EXISTS surveys_responses_parquet;
CREATE TABLE surveys_responses_parquet
AS
SELECT
rpad(ProviderNumber, 6, '0') AS ProviderID,
CommunicationwithNursesAchievementPoints,
CommunicationwithNursesImprovementPoints,
CommunicationwithNursesDimensionScore,
CommunicationwithDoctorsAchievementPoints,
CommunicationwithDoctorsImprovementPoints,
CommunicationwithDoctorsDimensionScore,
ResponsivenessofHospitalStaffAchievementPoints,
ResponsivenessofHospitalStaffImprovementPoints,
ResponsivenessofHospitalStaffDimensionScore,
PainManagementAchievementPoints,
PainManagementImprovementPoints,
PainManagementDimensionScore,
CommunicationaboutMedicinesAchievementPoints,
CommunicationaboutMedicinesImprovementPoints,
CommunicationaboutMedicinesDimensionScore,
CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints,
CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints,
CleanlinessandQuietnessofHospitalEnvironmentDimensionScore,
DischargeInformationAchievementPoints,
DischargeInformationImprovementPoints,
DischargeInformationDimensionScore,
OverallRatingofHospitalAchievementPoints,
OverallRatingofHospitalImprovementPoints,
OverallRatingofHospitalDimensionScore,
HCAHPSBaseScore,
HCAHPSConsistencyScore
FROM surveys_responses;
